# ImageMagick-convert

[ImageMagick](http://www.imagemagick.org/) のconvertコマンドを利用した画像変換プログラムです。  
プログラムと同階層にある指定拡張子の画像ファイルを変換します。  

※デフォルトではjpgファイルを長辺が300pxよりも大きさがある場合は縮小してjpg80%で書き出す処理をします
  

## Installation

win・mac、それぞれにあったファイルを準備します。

* Windows: `convert.sh`  （改行コード：LF）
* OS X: `convert.command`  （改行コード：CR+LF）

※拡張子と改行コードが違うだけで中身の記述は同じ
  

## Usage

プログラムと同階層に処理対象の画像を配置してファイルを`ダブルクリック/実行`。  
変換後のファイルは同階層に「`@export`」というフォルダが作成されて、その中に格納されます。

windowsでshファイルを実行する環境を整えるための方法は[参考サイト](http://www.koreyome.com/web/imagemagic-convert-01/)をご参照ください。  
macでconvert.command実行時に権限に関するエラーが出た時の対処法も記載しています。  
・参考サイト：[http://www.koreyome.com/web/imagemagic-convert-01/](http://www.koreyome.com/web/imagemagic-convert-01/)

※念のためプログラムと画像は他ファイル等が存在しない隔離された場所/フォルダ内で実行することを推奨
  

## Copyright
Copyright © 2014+ Tsutomu Takanashi. See LICENSE for details.






