#--------------------------------------------------
# file:         gitCommand.sh
# Description: 	Script to run git commands
# Created by: 	Darcy
# Date: 		2023-0110
# Version: 		1.0
# Usage: 		./gitCommand.sh
# Notes:        https://prograshi.com/general/git/how-to-use-git-fetch/ 
#--------------------------------------------------

#--------------------------------------------------
# ec2-user@:amazonlinux$ git --version
# git version 2.25.1
# ec2-user@:amazonlinux$
#--------------------------------------------------
# git --version


# --------------------------------------------------
# git commands
#
# ec2-user@:amazonlinux$ git
# add               clone             help              reflog            sparse-checkout
# am                commit            init              remote            stage
# apply             config            instaweb          repack            stash
# archive           describe          lfs               replace           status
# bisect            diff              log               request-pull      submodule
# blame             difftool          merge             reset             switch
# branch            fetch             mergetool         restore           tag
# bundle            format-patch      mv                revert            whatchanged
# checkout          fsck              notes             rm                worktree
# cherry            gc                pull              send-email
# cherry-pick       gitk              push              shortlog
# citool            grep              range-diff        show
# clean             gui               rebase            show-branch
# ec2-user@:amazonlinux$ git
# --------------------------------------------------


#--------------------------------------------------
# Git の基本的なコマンド
# ステージングとインデックスは同じ意味
# ワークツリーかわインデックスに内容を渡すことをaddする
# インデックスからワークツリーに内容を渡すことをcheckoutする
# インデックスからローカルリポジトリへ内容を渡すことをcommitする
# ローカルリポジトリからインデックスへ内容を渡すことをresetする
# ローカルリポジトリからリモートリポジトリへ内容を渡すことをpushする
# リモートリポジトリからローカルリポジトリへ内容を渡すことをpullする
#--------------------------------------------------


#--------------------------------------------------
# Gitの設定
#--------------------------------------------------
# ローカルリポジトリから作成する場合
# リモートリポジトリに対してpushやpullができるようにする
# git init # リポジトリを作成する
# git init repository_name # リポジトリを作成する
# git remote add origin https://github.com/darcy/amazonlinux.git # リモートリポジトリを追加する

# GitHubでリポジトリを新規作成する場合
#「Initialize this repository with a README」にチェックを入れると、リモートリポジトリの設定が自動的に行われます。そのため、git cloneしてきた後にリモートリポジトリの設定を行わなくてもpushやpullが使えるんですね。
# git clone repository_name # リポジトリをクローンする

#--------------------------------------------------
# git config key value # 設定を行う
# git config --global user.name "user_name" # ユーザー名を設定する
# git config --global user.email "user_email" # メールアドレスを設定する
# git config --global core.editor "editor_name" # エディタを設定する
# git config --global color.ui true # カラー表示を有効にする
# git config --global color.diff auto # 差分の色を自動で設定する
# git config --global color.status auto # ステータスの色を自動で設定する
# git config --global color.branch auto # ブランチの色を自動で設定する
# git config --global alias.co checkout # checkoutのエイリアスをcoに設定する
# git config --global alias.ci commit # commitのエイリアスをciに設定する
# git config --global alias.st status # statusのエイリアスをstに設定する


#--------------------------------------------------
# git status # リポジトリの状態を確認する
#--------------------------------------------------


#--------------------------------------------------
# コミットの設定
#--------------------------------------------------
# git revert HEAD # 最新のコミットを取り消す

#--------------------------------------------------
# 特定の時点までファイルを巻き戻す
#--------------------------------------------------
# git checkout HEAD^ -- file_name # ファイルを1つ前のコミットに戻す
# git checkout HEAD^^ -- file_name # ファイルを2つ前のコミットに戻す
# git checkout HEAD~3 -- file_name # ファイルを3つ前のコミットに戻す

#--------------------------------------------------
# --soft：HEADの位置のみ
# --mixed：HEADの位置・ステージ
# --hard：HEADの位置・ステージ・作業ディレクトリ
#--------------------------------------------------
# git reset --soft HEAD^ # 最新のコミットを取り消す
# git reset --hard HEAD^ # ひとつ前のコミットまでまるごと消したい
# git reset --hard 02f11b7
# git reset --mixed HEAD^ # 最新のコミットを取り消す


#--------------------------------------------------
# リポジトリの状態を確認する
#--------------------------------------------------
# git status # リポジトリの状態を確認する
# git status -s # 簡易表示


#--------------------------------------------------
# 上流ブランチ（Upstream branch）とは
#   ローカルブランチがどのリモートブランチを追跡しているかを示す。
#   あるローカルブランチが、履歴を追跡するように設定したリモートブランチの事。
# 　上流ブランチを設定することにより git pull でリモートブランチの内容を取得することができるようになります。
# 　https://www-creators.com/archives/4931
#--------------------------------------------------
# git branch -u origin/main main # ローカルブランチをリモートブランチに追従させる
# git branch -u origin/main # ローカルブランチをリモートブランチに追従させる
# git branch -vv # ローカルブランチの上流ブランチを確認する

#--------------------------------------------------
# リモート追跡ブランチ
#   リモートリポジトリのブランチをローカルリポジトリにコピーしたもの
#   特定のリモートブランチの状態をそのままコピーしたローカルブランチのこと
#
# トラッキングブランチ
#   特定のリモートブランチの状態をそのままコピーしたローカルブランチのこと
#--------------------------------------------------
# git branch -a # ローカルブランチとリモートブランチを表示する
# git branch -r # リモートブランチのみを表示する
# git checkout -b <branch_name> # ローカルブランチを作成する
# git checkout -b <branch_name> origin/<branch_name> # リモートブランチをローカルブランチにコピーする

#--------------------------------------------------
#
# git diff  # ワーキングツリーの差分

#--------------------------------------------------
# git log  # 現在のブランチのログ表示
# git log -p  # 現在のブランチのdiffも含めてログ表示
# git log -2  # 最新2つのコミットログを表示
# git log --oneline --graph  # ログをコミット毎に1行フォーマットで表示し、コミットツリーを表示する
#--------------------------------------------------


#--------------------------------------------------
# リモートレポジトリのコミット履歴をとってきて、ローカルレポジトリにコピーする。
# (ローカルリポジトリの中に main と orgin/main の2つの情報が置かれてる状況)
# -------------------------------------------------
# git fetch
# git fetch origin # 指定したリモートレポジトリの指定したブランチのみの最新のコミット履歴を取得する
# git fetch origin main:test # 指定したリモートレポジトリの指定したブランチのみの最新のコミット履歴を取得して、新たなローカルブランチを作成する
# git fetch second # 指定したリモートレポジトリの最新のコミット履歴をまるごと取得する
# git fetch second_remote main

#--------------------------------------------------
# ローカルのファイルを最新状態にする
# (git fetchを行った時に新しい更新があるとorgin/mainが最新になります)
#--------------------------------------------------
# git merge origin/main

#--------------------------------------------------
# git fetch と git merge を同時に行う
#--------------------------------------------------
# git pull

#--------------------------------------------------
# originとは
#   リモートリポジトリのアクセス先に対してGitがデフォルトでつける名前
#   https://reasonable-code.com/git-origin/
#--------------------------------------------------
# git remote -v # リモートリポジトリのアクセス先の設定を確認
# git remote -vv # 上流ブランチの有無も含めて確認する場合
# git remote -v show

# インデックスからのみファイルを削除する（追跡対象からはずす）
# git rm --cached <FILE_NAME>

exit 0

