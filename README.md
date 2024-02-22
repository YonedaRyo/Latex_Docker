# このDockerの説明
Ubuntu:24.04を使用したlatex環境\
texliveを使ってlatex環境を構築しました(2024年2月時点で動作確認)\
docker imageのビルドは割と時間がかかります．
修論と卒論等のテンプレートもついているので便利だと思います

Dockerを使わずにTexliveとVscodeを使った環境についてもレポジトリを作成しているのでそちらでもLatex環境構築は可能です．

## Dockerを使える環境の作成
### 必要なもの5選
- コマンドプロンプト or ターミナル(WindowsかMacかで異なる)
- Docker Desktop [https://www.docker.com/ja-jp/]
- Git [https://git-scm.com/]
- VScode (Docker,WSLの2つの拡張機能を入れておく)
- WSL2 [https://learn.microsoft.com/ja-jp/windows/wsl/install]

それぞれの環境構築に関しては自力でしてください\
YoutubeとかでDocker入門とかで調べて\
僕が参考にさせていただいたのは[https://www.youtube.com/watch?v=DNnW4I43wyU]

## ターミナル上でのcommand操作(windows)
### wsl2を用いてubuntuリモート環境を開く(コマンドターミナルで順番に打ち込む)
1. PowerShellを開く
```
PowerShell
```
2. ubuntuを開く
```
Ubuntu
```
### wls接続でリモート接続後にファイルを置くフォルダの作成
3. Ubuntu環境内に作業ディレクトリを作成 (Latex部分はファイル名なので好きに変えてください)
```
mkdir Latex
```
4. 作成したディレクトリが存在するか確認
```
ls
```
5. 作業ディレクトリに入る
```
cd Latex
```
6. VScodeをWSL接続で開く
```
code
```
- VScode上でmkdirで作成したファイルを開きDockerfile等をドラック&ドロップする
### docker imageの作成
7. latexというレポジトリでビルドする
```
docker image build -t latex:latest .
```
8. ビルドしたimageの一覧でlatexが存在するか確認
```
docker image ls
```
困ったときのコマンド一覧はdokker --helpで見れます
### 卒論や修論などbibを用いたコンパイル手順
作成したdocker imageを使ってlatexのソースをビルドする\
コマンドプロンプトでcdコマンドからコンパイルしたいファイルが入っている構造下に入る必要あり\
例えば，卒論テンプレを使用する場合は{cd 卒論}と打つ\
VScodeのTERMINALでビルドも可能
```
docker run --rm -v ${PWD}:/texsrc latex platex {ファイル名}.tex
```
```
docker run --rm -v ${PWD}:/texsrc latex pbibtex {ファイル名}
```
```
docker run --rm -v ${PWD}:/texsrc latex platex {ファイル名}.tex
```
```
docker run --rm -v ${PWD}:/texsrc latex platex {ファイル名}.tex
```
```
docker run --rm -v ${PWD}:/texsrc latex dvipdfmx {ファイル名}
```
