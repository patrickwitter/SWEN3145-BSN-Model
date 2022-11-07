-- open ObjectDiagrams\AcceptGameInvite\After_AcceptGameInvite.cmd
reset

--Creating Objects
!create d1: DateTime
!set d1.day := 2
!set d1.month := 2
!set d1.year := 2022
!set d1.hour := 12
!set d1.minute := 32
!set d1.second := 45

!create d2: DateTime
!set d2.day := 2
!set d2.month := 2
!set d2.year := 2022
!set d2.hour := 12
!set d2.minute := 33
!set d2.second := 0

!create bsn: BattleShipSocialNetwork

!create p1: Player
!set p1.username := 'KieranJag'
!set p1.playerGameSlot := GamePlayer::Player1
!create p2: Player
!set p2.username := 'MariaM'
!set p2.playerGameSlot := GamePlayer::Player2

!create rFact: RequestFactory 
!create gInvite: GameInvite
!set gInvite.status := RequestStatus::Recieved
!set gInvite.inviteStatus := InviteStatus::Accepted

!create g1: Game
!set g1.status := GameStatus::Initialized
!set g1.startedAt := d2

--Creating Assocations (Remember insertion order is important)
!insert(bsn, p1) into Players
!insert(bsn, p2) into Players

!insert(p1, rFact) into RequesterFact
!insert(rFact, gInvite) into Requests

!insert(p2, gInvite) into Recipients

-- Assocation Class
!create accept1: Accepted between (gInvite, g1)
!set accept1.dateAccepted := d1