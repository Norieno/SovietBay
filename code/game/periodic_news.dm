// This system defines news that will be displayed in the course of a round.
// Uses BYOND's type system to put everything into a nice format

/datum/news_announcement
	var
		round_time // time of the round at which this should be announced, in seconds
		message // body of the message
		author = "NanoTrasen Editor"
		channel_name = "Nyx Daily"
		can_be_redacted = 0
		message_type = "Story"

	revolution_inciting_event

		paycuts_suspicion
			round_time = 60*10
			message = {"� ������������� � �� ������� ��&#255;�����, ��� ��� ��������� ������� �������� �� ������ �����������������
			������&#255;� � ������� ��� ����.��������, ��� ��� ������� �� ���� ��������� ����� � ������� ���������&#255; �������
			������ ����� �������."}
			author = "Unauthorized"

		paycuts_confirmation
			round_time = 60*40
			message = {"����� �������������� ����� � ��������� �������� �� ����������������� ������&#255;� � ��������� ��� ����
			���� ������������. ��������� ��� ��, ��� ���������� ������� �������&#255; ������ "�������������" ���������.
			���� ��� �������&#255; �� �����."}
			author = "Unauthorized"

		human_experiments
			round_time = 60*90
			message = {"������&#255;���� ������ �� ������������� ��� ������ �������� ����� ����. �� ������ ������� � �����
						������� �� Tau Ceti. � ����� ���������&#255; �������, �� �������� ������������ ��� ������ ������
						� ��� ����� ���������� ��������� �������, ������������ ������������� � ������� �����&#255;�� ��&#255; ���� ���
						�� ���������� ��� � ���� ����� �����. �����, ��� ���������� �� ���� �� ���������������� �����&#255;��,
						�� �����������, � ������ ������������������� ��������, ������� ���� ��������� ������������
						� �������������, � �� ��������&#255;� ������� � ��������� "����������� �����&#255;"."}
			author = "Unauthorized"

	bluespace_research

		announcement
			round_time = 60*20
			message = {"����� ����������� ������� ������������ �� �������� ��������������� ��� ��� �� ���������� "��������
						������������" �������� ����� �����.�� ��� ����������� ������� � �����&#255;��� ����&#255; �� ������ � �������
						��� ����, �&#255;�������� ������ ����� ����������� ������������ ��&#255; ������������� � ��������� ���������������
						� �����������&#255; ���. �� ������, ��������� �� ��� ����� ���� "���������� ������". ��� ������&#255;�� �����������&#255;
						����� ���������&#255;��, ������ � ������ ��������&#255;."}

	random_junk

		cheesy_honkers
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Gibson Gazette"
			message = {"������ ����� ����������� ���� ��������? ��������� ������� ��������������&#255; �����&#255;� "���!"}
			round_time = 60 * 15

		net_block
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Gibson Gazette"
			message = {"��������� ���������� �������&#255;���&#255; ��&#255; ���������� ����� wetskrell.nt, ������������&#255; ����� ���
						������� ���������� ������."}
			round_time = 60 * 50

		found_ssd
			channel_name = "Nyx Daily"
			author = "Doctor Eric Hanfield"

			message = {"��������� ����� ���� ���������� ����� ����� ���������� ��� �������&#255;.
						��������&#255;, ��� ��� ��������� ��-�� ���������� ��� ��� ������ �� ��������, ��&#255;�&#255; ��
						����� ������� �����. ����� ������ ����������, ��� ������ �� ��� ������ � ���� ������
						������. � �� �������� ���� ���������� ��������������� �������."}
			round_time = 60 * 90

	lotus_tree

		explosions
			channel_name = "Nyx Daily"
			author = "Reporter Leland H. Howards"

			message = {"����� ����������� ��������� ����� ������ ��������� �� ���� ������� ������� ����� �������
						������&#255;, � ���� ���������������� ��������&#255; � ���, ��� ����� �������� ��������� 50 ������ �������.
						������� ������� ������&#255; �����������, �� ���� �������������, ��� ��� ����� ����� ��&#255;�� � ���������
						��������&#255; � ����������  ���-��, ������� ����������� ������&#255;, ����� �� ���&#255;����, ��� ����������
						�������� ���������� ����� � �������������� ����� ����� ��������� �����."}
			round_time = 60 * 30

	food_riots

		breaking_news
			channel_name = "Nyx Daily"
			author = "Reporter Ro'kii Ar-Raqis"

			message = {"��������� �������: "������� �����" �����������  �� ���� ������� ��������� ������� �
						������� ��������� �����. ��� ��������� ����� ����� ��������� ����� ����� ���� ��� ��������� ��
						���&#255;����, ��� ��������� � �������� �� �����, �����&#255;�� �� ���������� ����������&#255; ����������
						�����������, ��-�� ���� � �������� ��������� ����� ������� ������. ��������� �� �� ���� �������
						������������ � ������ ������������."}
			round_time = 60 * 10

		more
			channel_name = "Nyx Daily"
			author = "Reporter Ro'kii Ar-Raqis"

			message = {"��������� � ������� ������&#255;���� � �������: ����� ������� ������ ����� �� �� �������,
						��������&#255;: "�� ���� �������� �������&#255; ���������� ����-�� �����������", � "�������� &#255;��&#255;���&#255; ��,
						��� � ������� ��������� ����� ��������� �������� ������ ������. � ��� ���� ������� ������, �����
						��������� � ���� � �����&#255;��� ����&#255; ". ��������� �� �������� ��� ��������&#255;, ������&#255; �� "��� �����
						���������������" ����-�� ���������� � �������. � �� �� ����&#255;, �� ������� �� ������ ��������
						������&#255;���. ����� �������� �� ���� � 6."}
			round_time = 60 * 60


var/global/list/newscaster_standard_feeds = list(/datum/news_announcement/bluespace_research, /datum/news_announcement/lotus_tree, /datum/news_announcement/random_junk,  /datum/news_announcement/food_riots)

proc/process_newscaster()
	check_for_newscaster_updates(ticker.mode.newscaster_announcements)

var/global/tmp/announced_news_types = list()
proc/check_for_newscaster_updates(type)
	for(var/subtype in typesof(type)-type)
		var/datum/news_announcement/news = new subtype()
		if(news.round_time * 10 <= world.time && !(subtype in announced_news_types))
			announced_news_types += subtype
			announce_newscaster_news(news)

proc/announce_newscaster_news(datum/news_announcement/news)
	var/datum/feed_channel/sendto
	for(var/datum/feed_channel/FC in news_network.network_channels)
		if(FC.channel_name == news.channel_name)
			sendto = FC
			break

	if(!sendto)
		sendto = new /datum/feed_channel
		sendto.channel_name = news.channel_name
		sendto.author = news.author
		sendto.locked = 1
		sendto.is_admin_channel = 1
		news_network.network_channels += sendto

	var/author = news.author ? news.author : sendto.author
	news_network.SubmitArticle(news.message, author, news.channel_name, null, !news.can_be_redacted, news.message_type)
