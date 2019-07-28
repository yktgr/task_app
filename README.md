# README

usersテーブル

|name|email_address|password_digest|
|:-:|:-:|:-:|
|string|string|integer|

labelsテーブル

|label_name|task_id|user_id|
|:-:|:-:|:-:|
|string|integer|integer|

tasksテーブル

|title|content|status|priority|user_id|
|:-:|:-:|:-:|:-:|:-:|
|string|string|integer|integer|integer|


## デプロイ
  masterブランチに変更があった場合デプロイ
## インストール
  rails 5.2.3
