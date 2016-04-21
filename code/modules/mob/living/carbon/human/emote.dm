/mob/living/carbon/human/emote(var/act,var/m_type=1,var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	var/muzzled = istype(src.wear_mask, /obj/item/clothing/mask/muzzle)
	//var/m_type = 1

	for (var/obj/item/weapon/implant/I in src)
		if (I.implanted)
			I.trigger(act, src)

	if(src.stat == 2.0 && (act != "deathgasp"))
		return
	switch(act)
		if ("airguitar")
			if (!src.restrained())
				message =  "������ �� ������������ ������, ����&#255; �������."
				m_type = 1

		if ("blink")
			message = "�������."
			m_type = 1

		if ("blink_r")
			message = "������ �������."
			m_type = 1

		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "�����&#255;���&#255; [param]."
				else
					message = "����&#255;���&#255;."
			m_type = 1

		if ("custom")
			var/input = sanitize(input("Choose an emote to display.") as text|null)
			if (!input)
				return
			var/input2 = input("Is this a visible or hearable emote?") in list("Visible","Hearable")
			if (input2 == "Visible")
				m_type = 1
			else if (input2 == "Hearable")
				if (src.miming)
					return
				m_type = 2
			else
				alert("Unable to use this emote, must be either hearable or visible.")
				return
			return custom_emote(m_type, message)

		if ("me")

			//if(silent && silent > 0 && findtext(message,"\"",1, null) > 0)
			//	return //This check does not work and I have no idea why, I'm leaving it in for reference.

			if (src.client)
				if (client.prefs.muted & MUTE_IC)
					src << "\red You cannot send IC messages (muted)."
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			return custom_emote(m_type, message)

		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "����� ����� [param]."
				else
					message = "����� �����."
			m_type = 1

		if ("choke")
			if(miming)
				message = "����&#255;��� [get_visible_gender() == MALE ? "��������&#255;" : get_visible_gender() == FEMALE ? "����������" : "�������&#255;"] �� �����!"
				m_type = 1
			else
				if (!muzzled)
					message = "���������&#255;!"
					m_type = 2
				else
					message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "�����"] ���������� ����."
					m_type = 2

		if ("clap")
			if (!src.restrained())
				message = "�������."
				m_type = 2
				if(miming)
					m_type = 1
		if ("flap")
			if (!src.restrained())
				message = "������ �����&#255;��."
				m_type = 2
				if(miming)
					m_type = 1

		if ("aflap")
			if (!src.restrained())
				message = "������ ������ �����&#255;��!"
				m_type = 2
				if(miming)
					m_type = 1

		if ("drool")
			message = "������� �����."
			m_type = 1

		if ("eyebrow")
			message = "[get_visible_gender() == MALE ? "����&#255;�" : get_visible_gender() == FEMALE ? "����&#255;��" : "����&#255;�"] �����."
			m_type = 1

		if ("chuckle")
			if(miming)
				message = "��������� [get_visible_gender() == MALE ? "���������&#255;." : get_visible_gender() == FEMALE ? "�����������." : "���������&#255;."]"
				m_type = 1
			else
				if (!muzzled)
					message = "[get_visible_gender() == MALE ? "���������&#255;." : get_visible_gender() == FEMALE ? "�����������." : "���������&#255;."]"
					m_type = 2
				else
					message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "�����"] ���&#255;��� ����."
					m_type = 2

		if ("twitch")
			message = "������ ��������&#255;."
			m_type = 1

		if ("twitch_s")
			message = "������������&#255;."
			m_type = 1

		if ("faint")
			message = "[get_visible_gender() == MALE ? "�����&#255;�" : get_visible_gender() == FEMALE ? "�����&#255;��" : "�����&#255;�"] ��������."
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = 1

		if ("cough")
			if(miming)
				message = "[get_visible_gender() == MALE ? "��������&#255;" : get_visible_gender() == FEMALE ? "����������" : "��������&#255;"] ����&#255;����."
				m_type = 1
			else
				if (!muzzled)
					message = "����&#255;��!"
					m_type = 2
				else
					message = "������ ������� ����."
					m_type = 2

		if ("frown")
			message = "[get_visible_gender() == MALE ? "���������&#255;" : get_visible_gender() == FEMALE ? "�����������" : "���������&#255;"]."
			m_type = 1

		if ("nod")
			message = "������ �������."
			m_type = 1

		if ("blush")
			message = "��������."
			m_type = 1

		if ("wave")
			message = "�������&#255;."
			m_type = 1

		if ("gasp")
			if(miming)
				message = "����������, ��� ���������&#255;!"
				m_type = 1
			else
				if (!muzzled)
					message = "���������&#255;!"
					m_type = 2
				else
					message = "������ ������ ����."
					m_type = 2

		if ("deathgasp")
			message = "[species.death_message]"
			m_type = 1

		if ("giggle")
			if(miming)
				message = "��������� ��������!"
				m_type = 1
			else
				if (!muzzled)
					message = "��������."
					m_type = 2
				else
					message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "�����"] ���&#255;��� ����."
					m_type = 2

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "������� ������� �� [param]."
			else
				message = "������� �������."

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "������� �� [param]."
			else
				message = "�������."

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break

			if (!M)
				param = null

			if (param)
				message = "������� �� [param]."
			else
				message = "�������."
			m_type = 1

		if ("grin")
			message = "�����&#255;���&#255;."
			m_type = 1

		if ("cry")
			if(miming)
				message = "������."
				m_type = 1
			else
				if (!muzzled)
					message = "������."
					m_type = 2
				else
					message = "������ ����������� ����� �����."
					m_type = 2

		if ("sigh")
			if(miming)
				message = "[get_visible_gender() == MALE ? "��������" : get_visible_gender() == FEMALE ? "���������" : "��������"]."
				m_type = 1
			else
				if (!muzzled)
					message = "[get_visible_gender() == MALE ? "��������" : get_visible_gender() == FEMALE ? "���������" : "��������"]."
					m_type = 2
				else
					message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "�����"] ����� ����."
					m_type = 2

		if ("laugh")
			if(miming)
				message = "��������� ������&#255;."
				m_type = 1
			else
				if (!muzzled)
					message = "������&#255;."
					m_type = 2
				else
					message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "�����"] ���&#255;��� ����."
					m_type = 2

		if ("mumble")
			message = "��������."
			m_type = 2
			if(miming)
				m_type = 1

		if ("grumble")
			if(miming)
				message = "������!"
				m_type = 1
			if (!muzzled)
				message = "������!"
				m_type = 2
			else
				message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "�����"] ���&#255;��� ����."
				m_type = 2

		if ("groan")
			if(miming)
				message = "appears to groan!"
				m_type = 1
			else
				if (!muzzled)
					message = "������!"
					m_type = 2
				else
					message = "������ ������� ���&#255;��� ����."
					m_type = 2

		if ("moan")
			if(miming)
				message = "appears to moan!"
				m_type = 1
			else
				message = "������!"
				m_type = 2

		if ("johnny")
			var/M
			if (param)
				M = param
			if (!M)
				param = null
			else
				if(miming)
					message = "takes a drag from a cigarette and blows \"[M]\" out in smoke."
					m_type = 1
				else
					message = "says, \"[M], please. He had a family.\" [src.name] takes a drag from a cigarette and blows his name out in smoke."
					m_type = 2

		if ("point")
			if (!src.restrained())
				var/mob/M = null
				if (param)
					for (var/atom/A as mob|obj|turf|area in view(null, null))
						if (param == A.name)
							M = A
							break

				if (!M)
					message = "���������� ����-��."
				else
					pointed(M)

				if (M)
					message = "���������� �� [M]."
				else
			m_type = 1

		if ("raise")
			if (!src.restrained())
				message = "[get_visible_gender() == MALE ? "����&#255;�" : get_visible_gender() == FEMALE ? "����&#255;��" : "����&#255;�"] ����."
			m_type = 1

		if("shake")
			message = "������ �������."
			m_type = 1

		if ("shrug")
			message = "�������� �������."
			m_type = 1

		if ("signal")
			if (!src.restrained())
				var/t1 = round(text2num(param))
				if (isnum(t1))
					if (t1 <= 5 && (!src.r_hand || !src.l_hand))
						message = "raises [t1] finger\s."
					else if (t1 <= 10 && (!src.r_hand && !src.l_hand))
						message = "raises [t1] finger\s."
			m_type = 1

		if ("smile")
			message = "[get_visible_gender() == MALE ? "��������&#255;" : get_visible_gender() == FEMALE ? "����������" : "��������&#255;"]."
			m_type = 1

		if ("shiver")
			message = "������."
			m_type = 2
			if(miming)
				m_type = 1

		if ("pale")
			message = "�� ������� [get_visible_gender() == MALE ? "���������" : get_visible_gender() == FEMALE ? "����������" : "���������"]."
			m_type = 1

		if ("tremble")
			message = "� ����� ������!"
			m_type = 1

		if ("sneeze")
			if (miming)
				message = "[get_visible_gender() == MALE ? "������" : get_visible_gender() == FEMALE ? "�������" : "������"]."
				m_type = 1
			else
				if (!muzzled)
					message = "[get_visible_gender() == MALE ? "������" : get_visible_gender() == FEMALE ? "�������" : "������"]."
					m_type = 2
				else
					message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "�����"] �������� ����."
					m_type = 2

		if ("sniff")
			message = "�����."
			m_type = 2
			if(miming)
				m_type = 1

		if ("snore")
			if (miming)
				message = "[get_visible_gender() == MALE ? "������" : get_visible_gender() == FEMALE ? "�����" : "������"]."
				m_type = 1
			else
				if (!muzzled)
					message = "[get_visible_gender() == MALE ? "������" : get_visible_gender() == FEMALE ? "�����" : "������"]."
					m_type = 2
				else
					message = "[get_visible_gender() == MALE ? "������" : get_visible_gender() == FEMALE ? "�����" : "������"]."
					m_type = 2

		if ("whimper")
			if (miming)
				message = "���������� ��������&#255;."
				m_type = 1
			else
				if (!muzzled)
					message = "������."
					m_type = 2
				else
					message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "�����"] ������ ���&#255;��� ����."
					m_type = 2

		if ("wink")
			message = "[get_visible_gender() == MALE ? "���������" : get_visible_gender() == FEMALE ? "����������" : "���������"]."
			m_type = 1

		if ("yawn")
			if (!muzzled)
				message = "[get_visible_gender() == MALE ? "������" : get_visible_gender() == FEMALE ? "�������" : "������"]."
				m_type = 2
				if(miming)
					m_type = 1

		if ("collapse")
			Paralyse(2)
			message = "[get_visible_gender() == MALE ? "����" : get_visible_gender() == FEMALE ? "�����" : "����"]!"
			m_type = 2
			if(miming)
				m_type = 1

		if("hug")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					message = "[get_visible_gender() == MALE ? "���&#255;�" : get_visible_gender() == FEMALE ? "���&#255;��" : "���&#255;�"] [M]."
				else
					message = "[get_visible_gender() == MALE ? "���&#255;�" : get_visible_gender() == FEMALE ? "���&#255;��" : "���&#255;�"] ���&#255;."

		if ("handshake")
			m_type = 1
			if (!src.restrained() && !src.r_hand)
				var/mob/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					if (M.canmove && !M.r_hand && !M.restrained())
						message = "shakes hands with [M]."
					else
						message = "holds out [get_visible_gender() == MALE ? "his" : get_visible_gender() == FEMALE ? "her" : "their"] hand to [M]."

		if("dap")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M)
					message = "gives daps to [M]."
				else
					message = "sadly can't find anybody to give daps to, and daps [get_visible_gender() == MALE ? "himself" : get_visible_gender() == FEMALE ? "herself" : "themselves"]. Shameful."

		if ("scream")
			if (miming)
				message = "���������� ����!"
				m_type = 1
			else
				if (!muzzled)
					message = "������!"
					m_type = 2
				else
					message = "������ ����� ������� ����."
					m_type = 2

		if("swish")
			src.animate_tail_once()

		if("wag", "sway")
			src.animate_tail_start()

		if("qwag", "fastsway")
			src.animate_tail_fast()

		if("swag", "stopsway")
			src.animate_tail_stop()

		if ("help")
			src << {"blink, blink_r, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough,
cry, custom, deathgasp, drool, eyebrow, frown, gasp, giggle, groan, grumble, handshake, hug-(none)/mob, glare-(none)/mob,
grin, laugh, look-(none)/mob, moan, mumble, nod, pale, point-atom, raise, salute, shake, shiver, shrug,
sigh, signal-#1-10, smile, sneeze, sniff, snore, stare-(none)/mob, tremble, twitch, twitch_s, whimper,
wink, yawn, swish, sway/wag, fastsway/qwag, stopsway/swag"}

		else
			src << "\blue ����������&#255; �����&#255; '[act]'. Say *help for a list."





	if (message)
		log_emote("[name]/[key] : [message]")
		custom_emote(m_type,message)


/mob/living/carbon/human/verb/pose()
	set name = "Set Pose"
	set desc = "Sets a description which will be shown when someone examines you."
	set category = "IC"

	pose =  sanitize(input(usr, "This is [src]. [get_visible_gender() == MALE ? "He" : get_visible_gender() == FEMALE ? "She" : "They"] [get_visible_gender() == NEUTER ? "are" : "is"]...", "Pose", null)  as text)

/mob/living/carbon/human/verb/set_flavor()
	set name = "Set Flavour Text"
	set desc = "Sets an extended description of your character's features."
	set category = "IC"

	var/HTML = "<body>"
	HTML += "<tt><center>"
	HTML += "<b>Update Flavour Text</b> <hr />"
	HTML += "<br></center>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=general'>General:</a> "
	HTML += TextPreview(flavor_texts["general"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=head'>Head:</a> "
	HTML += TextPreview(flavor_texts["head"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=face'>Face:</a> "
	HTML += TextPreview(flavor_texts["face"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=eyes'>Eyes:</a> "
	HTML += TextPreview(flavor_texts["eyes"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=torso'>Body:</a> "
	HTML += TextPreview(flavor_texts["torso"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=arms'>Arms:</a> "
	HTML += TextPreview(flavor_texts["arms"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=hands'>Hands:</a> "
	HTML += TextPreview(flavor_texts["hands"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=legs'>Legs:</a> "
	HTML += TextPreview(flavor_texts["legs"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=feet'>Feet:</a> "
	HTML += TextPreview(flavor_texts["feet"])
	HTML += "<br>"
	HTML += "<hr />"
	HTML +="<a href='?src=\ref[src];flavor_change=done'>\[Done\]</a>"
	HTML += "<tt>"
	src << browse(sanitize_local(HTML, SANITIZE_BROWSER), "window=flavor_changes;size=430x300")
