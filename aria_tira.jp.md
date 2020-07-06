# ARIA TIRA(ARIAの理)

## 予約語

ARIA言語の**予約語**は以下の通りです。
変数名としてのご使用に**なれません**。

* ENDIA
* SYUA
* SA

以下の予約語は関数名としてのご使用に**なれません**。

* SELD
* NELSELD
* FEL
* FIE
* HORY
* HORK
* ARS
* WEL
* FIRY
* SASE
* FIRK
* LU
* YUERY
* WORY
* ENDY
* MIO
* SIE
* ENDK
* QURELY
* NEL
* NEN
* WIRY
* SAR
* ARY
* LO
* SE
* SO
* DIRY
* LE
* LEE
* RARY

## TIND (式)

* WELD (リテラル)
  * ORIA(数字型): `1`, `2`, `1.5`, ...
  * TIRA(論理型): `SELD`(true) , `NELSELD`(false)
  * ARIA(文字列型): `""`に囲まれた文字列。例えば、 `foo`, `hoge`, `しも～っす！`, ...
    * エスケープ文字:
      * `\\`: `\`そのまま
      + `\n`: 改行
      + `\t`: TAB
      + `\'`: 単純引用符`'`
      + `\"`: 二重引用符`"`
      + `\b`: 後退(Backspace)
* NELWELD (変数)

## HORY (宣言文)

### HORY NELWELD (変数の宣言)

変数名は英語大文字のみで構成されて、最後の文字は`A`に限定している。

#### 使用例

```aria
FEL HORY name, FIE value.
name HORK, FIE value.
```
変数の型は初期値から自動推論されて、手動指定の必要はありません。

### HOLY ENDY (関数の宣言)

関数名は英語大文字のみで構成されて、最後の文字は`A`以外の大文字に限定している。

```aria
FEL ARS LO 関数名, WEL FIRY 引数① (SA/SE 引数② ...).
  関数命令
  WEL FIRK 戻り値.
LU.
```

## IRY (演算)

### 算術演算

他のプログラミング言語と似て、ARIA言語では以下の演算子があります。

* 加算  `+`
* 減算  `-`
* 乗算  `*`
* 除算  `/`
* 剰余  `%`
  
注意：乗算と除算の優先順位は加算と減算より高い。

* 糖衣構文の(~ + 1) `YUERY`
* 糖衣構文の(~ - 1) `WORY`

### 比較演算

* 大なり         `>`
* 大なりイコール  `>=`
* 小なり         `<`
* 小なりイコール  `<=`
* 等しい         `=`

注意：`=`は**ORIA**(数字型)・**TIRA**(論理型)・**ARIA**(文字列型)とも適用されれる。
一方、`> >= < <=`は**ORIA**(数字型)のみに適用可能になる。

Notice `=` can operate on **ORIA**(Numbers), **TIRA**(Booleans) and **ARIA**(Strings)
but `> >= < <=` can only operate on **ORIA**(Numbers).

### 論理演算

* 論理積     `SA` or `SE`
* 論理和     `SO`

### その他

*  文字列結合  `&`

### ENDY (関数呼出)

```aria
FEL/LE/LEE ENDY 関数名 MIO 引数１名 SIE 引数１値, ... 
関数名 ENDK MIO 引数１名 SIE 引数１値, 引数２名 SIE 引数２値, ... 
```

## QURELY (代入)

```aria
変数名 QURELY 新しい値.
```

宣言された変数を新しい値にする。

## RARY-SYUA (条件判断)

```aria
論理型の式 RARY? SYUA 真の場合の命令
論理型の式 RARY? SYUA 真の場合の命令 NEL SYUA 偽の場合の命令
```

## ENDIA (繰り返し)


### 無限ループ (`do ... loop`)

```aria
FEL WIRY ENDIA.
  ループ命令
ENDIA LU.
```

### WHILEループ

```aria
FEL WIRY ENDIA SAR 条件式.
  ループ命令
ENDIA LU.
```

## ARY (値を出力)

```aria
FEL/LE/LEE ARY 出力する値（式）.
```

## コメント

`~`に囲まれた文字はコメント扱いになります。
コードの説明などにご活用ください。
```aria
~ This is a comment. ~
~ hoge piyo fuga foo bar ~
~ そして誰もいなくなった ~
```
