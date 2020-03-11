#IfWinNotActive, snow@ziggy

!x:: ; closing pages
if (Haystack != clipboard) {
	foo := clipboard
	bar := clipboard
	}
Else {
	clipboard := bar
	foo := clipboard
	}

send ^l
send ^c
Haystack := clipboard
clipboard := foo
	
If InStr(Haystack, "EditWorkOrderAjax") && InStr(Haystack, "edit=true") { ; submit service order
	send {SHIFTDOWN}{TAB}{TAB}{TAB}{TAB}{TAB}{SHIFTUP}{SPACE}
	}

Else If InStr(Haystack, "EditCustomerContact.aspx") { ; edit ticket log
	send {SHIFTDOWN}{TAB}{TAB}{TAB}{TAB}{SHIFTUP}{SPACE}
	}

Else If InStr(Haystack, "AddCustomerContact") || Instr(Haystack, "customerInfoEdit") || If InStr(Haystack, "EditWorkOrderAjax") || If InStr(Haystack, "productInfoEdit") { ;  save normal ticket log/update contact information/back to ticket from service order/update serial number
	send {SHIFTDOWN}{TAB}{TAB}{TAB}{SHIFTUP}{SPACE}
	}
return

!w:: ; opening and editing service orders
if (Haystack != clipboard) {
	foo := clipboard
	bar := clipboard
	}
Else {
	clipboard := bar
	foo := clipboard
	}

send ^l
send ^c
Haystack := clipboard
clipboard := foo

If InStr(Haystack, "TicketNo") { ; open new work order
	send ^f
	send ew Ser
	send {ESC}
	send {TAB}{SHIFTDOWN}{TAB}{SHIFTUP}
	send {SPACE}
	}
Else If InStr(Haystack, "AddWorkOrder") { ; create service order
	send ^f
	send spec
	send {ESC}
	send {TAB}
	send ^v
	send ^l
	send {SHIFTDOWN}{TAB}{TAB}{TAB}{SHIFTUP}{SPACE}
	}
Else If InStr(Haystack, "EditWorkOrderAjax") { ; editing service orders
	send {SHIFTDOWN}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{SHIFTUP}{SPACE}
	}
return

!+w::
send {CTRLDOWN}f{CTRLUP}
send cre
send {ESC}
send {TAB}{SHIFTDOWN}{TAB}{SHIFUP}
send {SPACE}
return

!v:: ; 9-6 scheduling and box checking # service order
send ^f
send ment da
sleep, 20
send {ESC}
sleep, 10
send {TAB}{TAB}{TAB}
send 9
send {TAB}
send 18
send ^f
send Diag
send {ESC}
send {TAB}{SHIFTDOWN}{TAB}{SHIFTUP}
sleep, 600
send {SPACE}
send {TAB}
sleep, 700
send {SPACE}
return

!+v:: ; for box checking
send ^f
send Diag
send {ESC}
send {TAB}{SHIFTDOWN}{TAB}{SHIFTUP}
send {SPACE}
send {TAB}
sleep, 600
send {SPACE}
return

^!v:: ; for just 9-6 scheduling, no box checking # service order
send ^f
send ment da
sleep, 20
send {ESC}
sleep, 10
send {TAB}{TAB}{TAB}
send 9
send {TAB}
send 18
send {TAB}
return

!t:: ; open ticket log/select SMS for ticket log
If WinActive("KW Office") {
	send ^f
	send ept no
	send {ESC}
	send {SHIFTDOWN}{TAB}{SHIFTUP}
	send {SPACE}
	}
Else {
	if (Haystack != clipboard) {
		foo := clipboard
		bar := clipboard
		}
	Else {
		clipboard := bar
		foo := clipboard
		}

	send ^l
	send ^c
	Haystack := clipboard
	clipboard := foo

	If InStr(Haystack, "TicketNo") { ; open ticket log
		send ^f
		send ept no
		send {ESC}
		send {SHIFTDOWN}{TAB}{SHIFTUP}
		send {SPACE}
		}
	Else If InStr(Haystack, "AddCustomerContact") { ; select SMS if the ticket log has focus
		send {TAB}{TAB}{TAB}
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
send ^f
send ent Ans
send {ESC}
send {TAB}{SHIFTDOWN}{TAB}{SHIFTUP}
send {SPACE}
return

; !+s:: ; open the Schedule Followup menu (antiquated) # main page
; send ^f
; send ule Fol
; send {ESC}
; send {TAB}{SHIFTDOWN}{TAB}{SHIFTUP}
; send {SPACE}
; return

!s:: ; Contact Success # ticket log
send {TAB}{TAB}{TAB}c
sleep, 400
send {TAB}{TAB}{TAB}{TAB}s{ESC}
sleep, 400
send ^f
send og m
send {ESC}{TAB}
return

!f:: ; Contact Fail # ticket log
send {TAB}{TAB}{TAB}c
sleep, 400
send {TAB}{TAB}{TAB}{TAB}f{ESC}
sleep, 400
send ^f
send og m
send {ESC}{TAB}
return

!+f:: ; update GSPN status to Contact Fail (works only if the ticket is acknowledged) # Update GSPN Status menu 
send {TAB}{DOWN}
sleep, 1000
send {TAB}{TAB}{SPACE}{DOWN}{DOWN}{ESC}{TAB}
return

!z:: ; open Zone Schedule # main page
send ^f
send ule Fol
send {ESC}
send {TAB}
send {SPACE}
return

!b:: ; pervious page # zone schedule
if WinActive("KW Office") {
	send {TAB}{TAB}{TAB}{SPACE}
	}
return

!n:: ; next page # zone schedule
if WinActive("KW Office") {
	send {TAB}{TAB}{TAB}{TAB}{TAB}{SPACE}
	}
return

!g:: ; sync with GSPN # main page
send ^f
send sync gsp
send {ESC}
send {TAB}{SHIFTDOWN}{TAB}{SHIFTUP}
send {SPACE}
return

!e:: ; open email templates (doesn't work) # main page
send ^f
send ate sta
send {ESC}
send {SHIFTDOWN}{TAB}{TAB}{SHIFTUP}
send {SPACE}
return

f2:: ; search phone number # url bar
If WinActive("Ticket Search") {
	send ^c
	send ^t
	x := "https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey="
	clipboard := RegExReplace(clipboard, "\D")
	y := clipboard
	z := x y
	clipboard := z
	send ^a
	send ^v
	clipboard := y
	send {RETURN}
	}

Else If WinActive("Max - Google Chrome") {
	send ^c
	send ^t
	x := "https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey="
	clipboard := RegExReplace(clipboard, "\D")
	y := clipboard
	z := x y
	clipboard := z
	send ^a
	send ^v
	clipboard := y
	send {RETURN}
	}

Else {
	x := "https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey="
	clipboard := RegExReplace(clipboard, "\D")
	y := clipboard
	z := x y
	clipboard := z
	send ^l
	send ^a
	send ^v
	clipboard := y
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
