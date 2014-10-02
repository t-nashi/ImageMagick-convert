#!/bin/sh

# プログラムの階層パスを取得
cwd=`dirname "${0}"`

# 現在のディレクトリをスタックに保存してディレクトリを移動 （pushd <--> popd）
pushd ${cwd}

# ディレクトリが無ければ作成
dir="@export"; [ ! -e $dir ] && mkdir -p $dir

# 読み込むファイル拡張子（対象ファイルに合わせて切り替え）
incExt=".jpg|.jpeg"
#incExt=".png"
#incExt=".gif"
#incExt=".psd"

# 書き出すファイル拡張子 （jpg, gif, png/png8/png24）
outExt="jpg"

# 変更サイズ （長辺をこのサイズにする/px） 「xxx」の場合はサイズ変換無し
fileSize="300"

# Exif情報に対する処理（-auto-orient -strip = 画像の向き情報以外削除）
exif=""
#exif="-strip"
#exif="-auto-orient -strip"

# colors （1～256）
colVal="256"

# depth
depVal="8"

# quality
quaVal="90"
#[jpg|mpeg] （1～100）
#[png]	10の位が圧縮率 （0=無圧縮 ～ 9=最高圧縮）
#		1の位が圧縮方式 （0=none、 1=sub、 2=up、 3=average、 4=Paeth）
#		The default PNG "quality" is 75

# 特定条件のファイル処理 / 拡張子を含んだファイルのみ処理（小文字・大文字を区別しない）
for line in `ls -F | grep -i -E "${incExt}"`
do

	# 「.psd」対しては「[0]」を付けてpsd全体の書き出しを行う必要がある
	if [ `echo ${line}|grep .psd` ]; then
		line=${line}[0]
	fi

	# リサイズをする・しない場合の両方に対応させた処理
	resizeOpt=""
	if [ ${fileSize} != xxx ]; then
		resizeOpt='-resize '${fileSize}'x> -resize x'${fileSize}'>'
	fi

	# 各書き出し拡張子に対しての処理
	case ${outExt} in
	*jpg*)
		convert -verbose ${line} ${exif} ${resizeOpt} -quality ${quaVal} ${dir}/${line%.*}.${outExt};;
	*png8*)
		convert -verbose ${line} ${exif} -resize ${resizeOpt} -colors ${colVal} PNG8:${dir}/${line%.*}.${outExt%8*};;
	*png*|*png24*)
		convert -verbose ${line} ${exif} -resize ${resizeOpt} -quality 95 ${dir}/${line%.*}.${outExt%24*};;
	*gif*)
		convert -verbose ${line} ${exif} -resize ${resizeOpt} -colors ${colVal} ${dir}/${line%.*}.${outExt};;
	*)
		convert -verbose ${line} ${exif} -resize ${resizeOpt} ${dir}/${line%.*}.${outExt};;
	esac

done

# 元のディレクトリへ戻る （pushd <--> popd）
popd

# プログラムの終了
exit
