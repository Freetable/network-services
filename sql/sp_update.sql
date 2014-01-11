-- CREATE DATABASE IF NOT EXISTS Freetable DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

source add_file_to_network.sql;
source add_file_to_playlist.sql;
source add_server_to_filelist.sql;
source create_playlist.sql;
source create_random_hash.sql;
source create_wwfileid.sql;
source create_wwuserid.sql;
source delete_file_from_playlist.sql;
source delete_playlist.sql;
source delete_server_from_file_list.sql;
source delete_user.sql;
source does_user_exist.sql;
source freetable_network_services.sql;
source get_avatar.sql;
source get_current_file.sql;
source get_file_info.sql;
source get_file_serverlist.sql;
source get_model.sql;
source get_playlist.sql;
source get_playlists.sql;
source get_sprite.sql;
source invalidate_user.sql;
source move_file_playlist.sql;
source move_file.sql;
source query_user.sql;
source recover_password.sql;
source rename_playlist.sql;
source set_avatar.sql;
source set_current_playlist.sql;
source set_file_info.sql;
source set_model.sql;
source set_sprite.sql;
source set_user_email.sql;
source set_user_first_name.sql;
source set_user_last_name.sql;
source set_user_long_descr.sql;
source set_user_nickname.sql;
source set_user_password.sql;
source set_user_short_descr.sql;
source user_played.sql;
source validate_user.sql;
source verify_file_md5.sql;
source verify_file_sha1.sql;
source verify_file_sha512.sql;
source verify_user.sql;

