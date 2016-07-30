/datum/event/radiation_storm
	var/const/enterBelt		= 30
	var/const/radIntervall 	= 5	// Enough time between enter/leave belt for 10 hits, as per original implementation
	var/const/leaveBelt		= 80
	var/const/revokeAccess	= 135
	startWhen				= 2
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0

/datum/event/radiation_storm/announce()
	command_announcement.Announce("������� ������� �������� ��������������� �&#255;��� �� ��������. ����������, �������� � ���� �� �������������� ����������� ��������", "�����������&#255; ������������", new_sound = 'sound/AI/radiation.ogg')

/datum/event/radiation_storm/start()
	make_maint_all_access()

/datum/event/radiation_storm/tick()
	if(activeFor == enterBelt)
		command_announcement.Announce("������&#255; ����� � ������������ ��&#255;�. ����������, ����������� � ���������� �����, ���� �� �� ������� ������������ ��&#255;�.", "�����������&#255; ������������")
		radiate()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == radIntervall)
		postStartTicks = 0
		radiate()

	else if(activeFor == leaveBelt)
		command_announcement.Announce("������&#255; ������ ������������ ��&#255;�. ���������� ���������� � ��������, ���� � ��� �������� �����-���� ��������� ��������. ����������� ������� � ������ ������� ����� ������������� �����.", "�����������&#255; ������������")

/datum/event/radiation_storm/proc/radiate()
	for(var/mob/living/carbon/C in living_mob_list_)
		var/area/A = get_area(C)
		if(!A)
			continue
		if(!(A.z in using_map.station_levels))
			continue
		if(A.flags & RAD_SHIELDED)
			continue

		if(istype(C,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = C
			H.apply_effect((rand(15,35)),IRRADIATE,blocked = H.getarmor(null, "rad"))
			if(prob(5))
				H.apply_effect((rand(40,70)),IRRADIATE,blocked = H.getarmor(null, "rad"))
				if (prob(75))
					randmutb(H) // Applies bad mutation
					domutcheck(H,null,MUTCHK_FORCED)
				else
					randmutg(H) // Applies good mutation
					domutcheck(H,null,MUTCHK_FORCED)

/datum/event/radiation_storm/end()
	revoke_maint_all_access()

/datum/event/radiation_storm/syndicate/radiate()
	return
