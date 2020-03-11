#SingleInstance force
SetNumLockState, AlwaysOn

CapsLock::send {Return}

+Capslock::send {SHIFTDOWN}{RETURN}{SHIFTUP}

#IfWinNotActive, snow@ziggy
`::
send {BACKSPACE}
return

F1::/

:O0:cci::customer called in
:O0:ccic::customer called in to confirm appt
:O0:ccim::customer called in off missed call
:O0:ccir::customer called in to reschedule
:O0:ccis::customer called in to schedule

:O0:cciwe::customer called in for service. claims IW. will email in receipt

:O0:tt::talked to
:O0:td::told

:O0:hu::hung up
:O0:cb::call back

:O0:ph::phone

:O0:uif::unidentified female
:O0:uim::unidentified male
:O0:uip::unidentified person
:O0:pif::paid in full

:O0:pu::picked up

:O0:vm::voice mail
:O0:num::number

:O0:noa::called to schedule, line kept ringing, call released

:O0:im::ice maker
:O0:imn::ice maker not making ice
:O0:imnfro::ice maker not making ice, frosting over

:O0:lm::called to schedule lmom
:O0:lm1::called to schedule lmom 1a
:O0:lm2::called to schedule lmom 2a
:O0:lm3::called to schedule lmom 3a
:O0:lm4::called to schedule lmom 4a
:O0:lm5::called to schedule lmom 5a

:O0:slm::called for symptoms lmom

:O0:ck::check call
:O0:clm::check call lmom
:O0:cl1::check call lmom 1a
:O0:cl2::check call lmom 2a
:O0:cl3::check call lmom 3a

:O0:novm::called to schedule, no voice mail, no message left
:O0:vmnsu::called to schedule, voice mail not set up, no message left
:O0:vmf::called to schedule, voice mail full, no message left
:O0:mbf::called to schedule, voice mail full, no message left
:O0:linb::called to schedule, line busy, no message left

:O0:sne::called for s/n. cx will reply to email
:O0:snt::called for s/n. cx will reply to text
:O0:sncb::called for s/n. cx will call back with that info

:O0:ccisne::customer called in. didn't have s/n. will reply to email
:O0:ccisnt::customer called in. didn't have s/n. will reply to email
:O0:ccisnc::customer called in. didn't have s/n. will call back

:O0:cxu::cx understood

:O0:dis::called to schedule, number not in service, no message left
:O0:rej::called to schedule, call rejected, no message left
:O0:nml::no message left

:O0:ss::Samsung
:O0:extw::extended warranty
:O0:acco::accommodations

:O0:fr::fridge
:O0:fz::freezer

:O0:cp::control panel

:O0:ccl::complete cooling loss
:O0:chl::complete heating loss
:O0:pcl::partial cooling loss
:O0:phl::partial heating loss
:O0:ncl::no cooling loss
:O0:nhl::no heating loss
:O0:ncl::no cooling loss
:O0:cpl::complete power loss
:O0:ps::power cycling
:O0:fro::frosting over

:O0:con::confirmed contact information
:O0:upd::updated contact information

:O0:tf::time frame
:O0:rs::reschedule

:O0:;oow::customer agreed to oow costs via cc
:O0:dec::customer declined oow costs
:O0:;otw::advised cx of OTWER limitations

:O0:pref::customer preferred later date

:O0:mor::cx requested morning appt
:O0:eve::cx requested evening appt

:O0:dif::cx requesting different technician
:O0:noi::no other issues
:O0:noe::no error codes
:O0:nss::no strange sounds

:O0:spa::cx requested spanish. advised spanish agent would call back

:O0:soo::called to offer sooner appt. no answer, no message left
:O0:sooacc::called to offer sooner appt. cx accepted
:O0:soodec::called to offer sooner. cx declined

:O0:cts::called to schedule
:O0:cta::called to schedule
:O0:ctr::called to reschedule

:O0:ccins::customer called in for service. advised to call Samsung for new ticket. cx understood
:O0:ccine::customer called in for service. advised to call extended warranty for new ticket. cx understood

:O0:ssciu::Samsung called in for update on ticket
:O0:extwciu::extended warranty called in for update on ticket
:O0:cciu::customer called in for update on ticket

:O0:ssci::Samsung called in
:O0:extwci::extended warranty called in

::tun::
temp := clipboard
x := "cx has two units "
y := clipboard
z := x y
clipboard := z
send ^v
clipboard := temp
return

:O0:;vid::https://app.clipchamp.com/

::dmg::
SendInput,
(
1) What was damaged, and how was it damaged?
2) When did you first see the damage, and was the technician notified on-site?
3) What is your desired outcome for this claim? 
Please have cx send pictures of the damage and its surrounding area to email: voc@servicequick.com
	)
return

:O0:;Ana::2 per dar

:O0:;Atl::1 per day

:O0:;Bos::2 per day

:O0:;Cin::2 per day

:O0:;Cle::4 per week

:O0:;Col::2 per day

:O0:;Chi::1 per day

:O0:;Gre::1 per day

:O0:;Haw::1 per day

:O0:;LA::2 per day

:O0:;Mur::1 per day

:O0:;NJ::3 per day per Zone

:O0:;Ont::1 per day

:O0:;Pho::2 per day

:O0:;Pit::2 per day

:O0:;Ral::1 per day

:O0:;SD::2 per day

:O0:;SF::2 per day

:O0:;Vall::1 per day

:O0:;Vir::1 per day

:O0:sAtl::zone avail

:O0:sBos::zone avail

:O0:sMur::zone avail

:O0:sCin::zone avail

:O0:sCle::zone avail

:O0:sHaw::zone avail

:O0:sRal::zone avail

:O0:sPit::zone avail except C

:O0:sNJ::zone avail

:O0:sAna::total avail

:O0:sLA::total avail

:O0:sOnt::total avail

:O0:sSD::total avail

:O0:sVall::total avail

:O0:sCol::total avail

:O0:sChi::total avail

:O0:sPho::total avail

:O0:sSF::total avail

:O0:hq::877 412 1665

:O0:nscnum::424 226 6866 ext 2496

:O0:nscsamaritannum::989 832 7986

:O0:nscchambersnum::309 829 6750

:O0:nsclanes::517 393 1102

:O0:nscphillips::269 270 3467

:O0:nscds::847 534 6741

:O0:nscnec::314 486 8557

:O0:nscbeatty::217 787 4747

:O0:nscbelson::716 708 8442

:O0:ssnum::800 726 7864

#IfWinNotActive
