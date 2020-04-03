#IfWinNotActive, snow@ziggy
#SingleInstance Force

!x:: ; closing pages
If ThisPageIs("EditWorkOrderAjax") && ThisPageIs("edit=true") { ; submit service order
	TabTimes(0, 5, "space")
	}

Else If ThisPageIs("EditCustomerContact.aspx") { ; edit ticket log
	TabTimes(0, 4, "space")
	}

Else If ThisPageIs("AddCustomerContact") || If ThisPageIs("customerInfoEdit") || If ThisPageIs("EditWorkOrderAjax") || If ThisPageIs("productInfoEdit") { ;  save normal ticket log/update contact information/back to ticket from service order/update serial number
	TabTimes(0, 3, "space")
	}
return

!w:: ; opening and editing service orders
If ThisPageIs("TicketNo") { ; open new work order
	FindButton("New Service Order")
	TabTimes(1, 1, "space")
	}
Else If ThisPageIs("AddWorkOrder") { ; create service order
	FindButton("**Only Shows on Tablet**")
	TabTimes(1)
	send ^v
	send ^l
	TabTimes(0, 3, "space")
	}
Else If ThisPageIs("EditWorkOrderAjax") { ; editing service orders
	TabTimes(0, 6, "space")
	}
return

!+w::
FindButton("create")
TabTimes(1, 1, "space")
return

!v:: ; 9-6 scheduling and box checking # service order
FindButton("Appointment Date")
TabTimes(3)
send 9
TabTimes(1)
send 18
FindButton("Diagnosis", false)
TabTimes(1, 1)
sleep, 600
send {SPACE}
TabTimes(1)
sleep, 700
send {SPACE}
return

!+v:: ; for box checking
FindButton("Diagnosis")
TabTimes(1, 1, "space")
TabTimes(1)
sleep, 700
send {SPACE}
return

^!v:: ; for just 9-6 scheduling, no box checking # service order
FindButton("Appointment Date")
TabTimes(3)
send 9
TabTimes(1)
send 18
TabTimes(1)
return

!t:: ; open ticket log/select SMS for ticket log
If WinActive("KW Office") {
	FindButton("Claim Dept Note")
	TabTimes(0, 1, "space")
	}
Else {
	If ThisPageIs("TicketNo") { ; open ticket log
		FindButton("Schedule Follow Up")
		TabTimes(2,, "space")
		}
	Else If ThisPageIs("AddCustomerContact") { ; select SMS if the ticket log has focus
		TabTimes(3)
		send s
		}
}
return

!c::
send ^l
send ^c
clipboard := RegExReplace(clipboard, "^[^=]*=")
clipboard := RegExReplace(clipboard, "&.*$")
return

!a:: ; click Agent Answered Callfire # main page
FindButton("Agent Answered Call Fire")
TabTimes(1, 1, "space")
return

; !+s:: ; open the Schedule Followup menu (antiquated) # main page
; FindButton("Schedule Follow Up")
; TabTimes(1, 1, "space")
; return

!s:: ; Contact Success # ticket log
TabTimes(3)
send c
sleep, 500
TabTimes(4)
send s
sleep, 500
FindButton("- LOG MESSAGE -")
TabTimes(1)
return

!f:: ; Contact Fail # ticket log
TabTimes(3)
send c
sleep, 500
TabTimes(4)
send f
sleep, 500
FindButton("- LOG MESSAGE -")
TabTimes(1)
return

!+f:: ; update GSPN status to Contact Fail (works only if the ticket is acknowledged) # Update GSPN Status menu 
TabTimes(1)
send {DOWN}
sleep, 1000
TabTimes(2)
send {DOWN}{DOWN}{ESC}
TabTimes(1)
return

!z:: ; open Zone Schedule # main page
FindButton("Schedule Follow Up")
TabTimes(1,, "space")
return

!b:: ; pervious page # zone schedule
if WinActive("KW Office") {
	TabTimes(3,, "space")
	}
return

!n:: ; next page # zone schedule
if WinActive("KW Office") {
	TabTimes(5,, "space")
	}
return

!g:: ; sync with GSPN # main page
FindButton("Sync with GSPN")
TabTimes(1, 1, "space")
return

!e:: ; open email templates (doesn't work) # main page
FindButton("Generate CX Letter/Email")
TabTimes(1, 1, "space")
return

f2:: ; search phone number # url bar
If WinActive("Ticket Search") || If WinActive("MAX") {
	send ^c
	send ^t
	LeaveOnlyNumbers()
	send ^l
	send ^a
	SwitchNPaste("https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey=", clipboard)
	send {RETURN}
	}
Else {
	LeaveOnlyNumbers()
	send ^l
	send ^a
	SwitchNPaste("https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey=", clipboard)
	send {RETURN}
	}
return

+~:: ; select all and copy
send ^a
send ^c
return

^#v:: ; exchange cliboard and selection (useful for switching primary and secondary phone numbers, among other things)
pastebackup = %clipboard%
ClipWait, 0.05, 1
clipboard =
ClipWait, 0.05, 1
Send ^c
ClipWait, 0.05, 1
clipboardbackup = %clipboard%
ClipWait, 0.05, 1
clipboard = %pastebackup%
ClipWait, 0.05, 1
Send ^v
clipboard = %clipboardbackup%
ClipWait, 0.05, 1
return

#IfWinNotActive


; Begin Functions

ThisPageIs(page){ ; checks if the current URL contains the paramater.
	foo := clipboard
	send ^l
	send ^c
	Haystack := clipboard
	clipboard := foo
	If InStr(Haystack, page) {
		return true
		}
	Else {
		return false
		}
	}

LeaveOnlyNumbers() { ; uses RegEx to take out all non-number characters from the clipboard. Also makes a backup of the unadulturated clipboard for convenience
	temp := clipboard
	clipboard := RegExReplace(clipboard, "\D")
	}

SwitchNPaste(new_board, y:="") {
	switch_temp := clipboard
	clipboard := new_board y
	send ^v
	clipboard := switch_temp
	}

FindButton(button_name, returnq:=true) {
	send ^f
	SwitchNPaste(button_name)
	If returnq {
		send {RETURN}
		}
	send {ESC}
	}

TabTimes(times_forward, times_backward:=0, space_or_no:=false, forward_again:=0) {
	Loop %times_forward% {
		send `t
		}
	Loop %times_backward% {
		send +`t
		}
	Loop %forward_again% {
		send `t
		}
	If space_or_no {
		send {SPACE}
		}
	}
