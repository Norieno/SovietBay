
/proc/communications_blackout(var/silent = 1)

	if(!silent)
		command_announcement.Announce("��������. ������&#255; ������ � ���� ������ ����������. ��&#255;�� �� ��������� ��������������� �������� ����������. ��&#255;�-��-�-�-�-�-�...", new_sound = 'sound/misc/interference.ogg')
	else // AIs will always know if there's a comm blackout, rogue AIs could then lie about comm blackouts in the future while they shutdown comms
		for(var/mob/living/silicon/ai/A in player_list)
			A << "<br>"
			A << "<span class='warning'><b>������&#255; ������ � ���� ������ ����������. ��&#255;�� �� ��������� ��������������� �������� ����������. ��&#255;�-��-�-�-�-�-�...</b></span>"
			A << "<br>"
	for(var/obj/machinery/telecomms/T in telecomms_list)
		T.emp_act(1)
