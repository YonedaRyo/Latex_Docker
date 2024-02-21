# このDockerの説明
Ubuntu:24.04を使用したlatex環境\
texliveを使ってlatex環境を構築しました(2024年2月時点で動作確認)\
知識0から急遽作った為あまりDockerの理解をしていなく，かなり怪しいですが動きます．\
docker imageのビルドは割と時間がかかります．

## Dockerを使える環境の作成
### 必要なもの5選
- コマンドプロンプト or ターミナル(WindowsかMacかで異なる)
- Docker Desktop [https://www.docker.com/ja-jp/]
- Git [https://git-scm.com/]
- VScode (Docker,WSLの2つの拡張機能を入れておく)
- WSL2 [https://learn.microsoft.com/ja-jp/windows/wsl/install]

それぞれの環境構築に関しては自力でしてください\
YoutubeとかでDocker入門とかで調べて\
僕が参考にさせていただいたのは[https://www.youtube.com/watch?v=DNnW4I43wyU]です

## ターミナル上でのcommand操作(windows)
### wsl2を用いてubuntuリモート環境を開く(コマンドターミナルで順番に打ち込む)
1. PowerShell
2. ubuntu
### wls接続でリモート接続後にファイルを置くフォルダの作成
3. mkdir Latex (Latex部分はファイル名なので好きに変えてください)
4. ls (作成したフォルダが存在するか確認)
5. cd Latex (作成したフォルダに入る)
6. code (VScodeでWSL接続で入る)
- VScode上でmkdirで作成したファイルを開きDockerfile等をドラック&ドロップする
### docker imageの作成
7. docker image build -t latex:latest . (latexというレポジトリでビルドする)
8. docker image ls (ビルドしたimageの一覧でlatexが存在するか確認)

困ったときのコマンド一覧はdokker --helpで見れます
### 卒論や修論などbibを用いたコンパイル手順
作成したdocker imageを使ってlatexのソースをビルドする\
コマンドプロンプトでcdコマンドからコンパイルしたいファイルが入っている構造下に入る必要あり\
例えば，卒論テンプレを使用する場合は{cd 卒論}と打つ\
VScodeのTERMINALでビルドも可能
- docker run --rm -v ${PWD}:/texsrc latex platex {ファイル名}.tex
- docker run --rm -v ${PWD}:/texsrc latex pbibtex {ファイル名}
- docker run --rm -v ${PWD}:/texsrc latex platex {ファイル名}.tex
- docker run --rm -v ${PWD}:/texsrc latex platex {ファイル名}.tex
- docker run --rm -v ${PWD}:/texsrc latex dvipdfmx {ファイル名}
