<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"rel="stylesheet">
<style>
  a::after {
      padding: 0 4px;
      content: "\f35d";
      font-family: "Font Awesome 5 Free";
      font-weight: 900;
      font-size: 0.8rem;
}
  @media print{
    @page { margin: 0; }
    body { margin: 1.6cm; }
}
  h2 {
    border-left: solid 6px #28a745;
    border-bottom: none!important;
    padding-left: 16px;
    height: 40px!important;
    line-height: 40px!important;
    font-weight: bold!important;
}
  h3 {
    padding-left: -14px;
    border-bottom: dashed #ccc 1px;
}
  h3:before {
    content: "■ ";
    color: #17a2b8;
}
  th, td {
    border: solid 1px #666;
}
  table {
    margin-bottom: 30px;
}
  strong {
    color: #000;
}
hr {
          margin-bottom: 30px;
          border-color: #ccc;
        }
        blockquote {
          background: none!important;
          /* font-style: italic; */
          color: #999;
}
</style>



# PHP基礎課題
## 始めに
本課題では、**PHP**のコーディングの基本を学んでいきます。  
始めに、PHPについて少しお話しておきましょう。  
PHPは**サーバサイド**の基本的な処理に使用される言語で、その学習のしやすさから多くの人に使われています。  
また、PHPは、以下のような特徴を持っています。
- HTMLに埋め込みが可能である。  
- 型（中身の種類を決めるもの）の判定を自動でやってくれる。  

これらの特徴から初心者に向いていると言われています。  
またPHPは、**WEBアプリケーション、サービスに作るのに適している言語**です。  

本課題ではかなり基本的なことをやっていきますが、これらはとても大事なことです。  
走り始めるにはまず、歩き方を知らなければなりません。  

では、始めましょう。


```php
// 変数の宣言
$basic_php = 'PHPの基礎だよ!';

// var_dump(確認したい変数)
var_dump($basic_php) // PHPの基礎だよ!
```


<div style="page-break-before:always"></div>  
<br>  


## 前提条件
まず、知識としては「いきなり　はじめる　PHP」を一通り完了していることとします。    
使用言語はもちろん「PHP」、バージョンの指定は行いません。  
実行環境については、PHPが動き、結果が確認できる環境であれば、問題ありません。  

また、これから**学習する内容について**ですが、これらは**全てではなくよく使うものだけ**にしています。  
さらに詳しく知りたい場合や、よく分からない場合には是非検索して調べてみましょう。


## PHPの書き方
PHPでプログラミングしていく場合には、以下のような書き方になります。
```php
<?php

// ここにプログラムを書いていく

?>
```
また、ソース上に **コメント** を残したい場合、  
**//** を文頭につけることで**実行されない文字列を残す**ことができます。  
なので、上記のサンプルコード上の  
「// ここにプログラムを書いていく」  
は実行されません。


<div style="page-break-before:always"></div>  
<br>  


# １.　型
変数宣言時、宣言方法によって値の種類を見分ける**型**が決まります。  
型によってできることが違い、それぞれの役割があります。  
＊詳細は[ここ](https://www.php.net/manual/ja/language.types.php)を参照してください。  


<div style="page-break-before:always"></div>  
<br>  



## 論理値 ( Boolean 
---
**論理値型**は、最も簡単な型で**真偽の値**を表します。  
型名略称は**bool**です。  
### 論理値型の宣言
値は、**TRUE** または **FALSE** のどちらかになります。
```php
$true = True; 
$false = False;

var_dump($true)  // bool(true)
var_dump($false) // bool(false)
```
<div style="page-break-before:always"></div>  
<br>



## 整数 ( Integer )
---
**整数型**は数字を扱う型です。  
型名略称は**int**です。    
### 整数型の宣言
変数宣言時には整数を代入します。  
なお、***整数型では少数点が扱えません。***  
少数点を扱いたい場合には、 [浮動小数点数型](https://www.php.net/manual/ja/language.types.float.php)を参照してください。
```php
$number = 6;
var_dump($number); // int(6)
```

### 演算子を使用した計算
数値型では演算子を使用した計算が可能です。  
```php
// 整数の宣言
$a = 9;
$b = 3;

// 加算	$a および $b の合計
$c = $a + $b	
var_dump($c); // int(12)

// 減算	$a と $b の差
$c = $a - $b	
var_dump($c); // int(6)

// 乗算	$a および $b の積
$c = $a * $b	
var_dump($c); // int(27)

// 除算	$a および $b の商
$c = $a / $b	
var_dump($c); // int(3)

// 剰余	$a を $b で割った余り
$c = $a % $b	
var_dump($c); // int(0)

// 累乗	$a の $b 乗。 PHP 5.6から。
$c = $a ** $b 
var_dump($c); // int(729)
```


<div style="page-break-before:always"></div>  
<br>  


## 文字列 ( String )
---
**文字列**はその名の通り文字列を扱う型です。  
文字列型では文字列間の結合や、文字の置換などが行えます。  
型名略称は**str**です。    
画面への表示も文字列での実行になるので扱う機会は多くあるでしょう。


### 文字列型の宣言  

文字列をクオーテーションで囲って変数に代入します。  
また、ダブルクオーテーションでも構いません。

```php
$basic_php = 'PHPの基礎だよ!';

var_dump($basic_php); // string(PHPの基礎だよ!)
```

### 文字列の結合

変数を**ドット**で繋ぐことで文字列の結合が可能です。 
```php
// 文字列型の変数宣言
$word = "文字列";
$join = "結合";

// ドット(.)で繋ぐ
$word_join = $word.$join

var_dump($word_join); // string(文字列結合)
```

また、文字列と変数でも可能です。
```php 
$word = "文字列";
$joined_word = '結合した'.$word

var_dump($joined_word); // string(結合した文字列)
```





<div style="page-break-before:always"></div>  
<br>  



## 配列 ( array )
---
さて、今までは**１つの変数**に対して**１つの値**を格納していました。    
次に**１つの変数**に**複数の値**をもつ型を学んでいきます。  それが**配列型**です。  

### 配列の宣言  

配列の宣言には、**array()** を使用します。

```php
// array()を使用した宣言
$array = array( 'data1', 'data2', 'data3');

var_dump($array) // ['data1','data2','data3']
```


### 配列内の値の取得  
配列の宣言時、値それぞれに対応する、0から順に振られた数字（**キー**）が振られます。  
特定の値を取得したい場合はこのキーを指定し、値を取得します。
```php
$array = array(
    'data1',    // 0 ← キー
    'data2',    // 1
    'data3'     // 2
);

//キー指定で値の取得を行う
var_dump($array[0]); // 'data1'
```
### 配列内の値の追加  
配列型は $変数[] に値を代入することで配列の追加が可能です。  
```php
$array = array(
    'data1',    // 0 ← キー
    'data2',    // 1
    'data3'     // 2
);

// 配列の追加
$array[] = 'data4'

//追加されている
var_dump($array) // ['data1', 'data2', 'data3', 'data4', ]

//キー指定で値の取得を行う
var_dump($array[3]); // 'data4'
```

<div style="page-break-before:always"></div>  
<br>  




## 連想配列
---
また配列の値を取得するための**キー**は、**自分で決めた文字列を設定することも可能**です。  
これを**連想配列**と呼びます。  
配列と同じようにarray()で宣言しますが、その際に**キーを指定します**。
### 連想配列の宣言  
```php
// 'キー' => データ で宣言
$array = array(
    'one' => 'data1',       // 'one' ← キー
    'two' =>  'data2',      // 'two'
    'three' => 'data3'      // 'three'
);
```
### 連想配列の値の取得  
値の取得をしたい場合には、配列と同じようにキー指定を行います。    
```php
//キー指定で値の取得を行う
var_dump($array['two']); // 'data2'
```

### 連想配列の値の追加  
値を追加したい時には、**キーを指定し**、値を代入します。  
また、**すでに存在しているキーを指定した場合**には**値が上書きされるの**で注意しましょう。
```php
$array = array(
    'one' => 'data1',       // 'one' ← キー
    'two' =>  'data2',      // 'two'
    'three' => 'data3'      // 'three'
);

//キーを指定し値の追加を行う
$array['four'] = 'data4';

//追加されている
var_dump($array); // ['data1', 'data2', 'data3', 'data4', ]

var_dump($array['four']); // 'data4'
```

<div style="page-break-before:always"></div>  
<br>  
<br>  
<br>  




###  配列と連想配列を使用した入れ子の配列
また、配列は入れ子にすることが可能で、配列、連想配列の両方が使えます。  
```php
// 配列の宣言
$array = array(
    'data1',
    'data2',
    'data3',
    // 連想配列の入れ子
    'array_in_array' => array(
        'data4',
        'data5',
        'data6'
    ),
    // 連想配列
   'data_7' => 'data7'
);

// データの取得
var_dump($array[2]);                    // 'data3'
var_dump($array['array_inarray']);      // ['data4','data5','data6'] 
var_dump($array['array_inarray'][0]);   // 'data4'
var_dump($array['data_7']);             // 'data7'
```


<div style="page-break-before:always"></div>  
<br>  


## NULL
---
**NULL**は**特別**な型です。  
変数に**値が存在しないこと**を表します。  
NULLは  
- 変数にNULLが代入されている
- まだ値が何も代入されていない  

場合にNULLと判定されます。

<div style="page-break-before:always"></div>  
<br>  
<br>  



# 練習課題 ）１.　型
<font color='red'>＊</font>参照する ... var_dump()で値を参照すること。

## 1 . 論理値
(１)　値が TRUE の論理値型の変数を宣言し、参照してみましょう。  

(２)　値が FALSE の論理値型の変数を宣言し、参照してみましょう。

## 2 . 整数
(１)　適当な値の整数型の変数を宣言し、参照してみましょう。  

(２)　1 + 2 の計算を行い、結果を参照してみましょう。  

(３)　50 - 35 の計算を行い、結果を参照してみましょう。  

(４)　2 × 8 の計算を行い、結果を参照してみましょう。  

(５)　16 ÷ 4 の計算を行い、結果を参照してみましょう。  

(６)　2の2乗 の計算を行い、結果を参照してみましょう。  

(７)　100 × ( ( 50 - 39 + 70 ) ÷ 3 ) の計算を行い、結果を参照してみましょう。  

## 3 . 文字列
以下の**文字列型**の変数を宣言してください。
| 変数名 | 値 |
| ----- | ----- |
| $hello | 'こんにちは' |
| $michael | 'マイケル' |

(１)　変数  $hello を参照してみましょう。

(２)　変数 $hello と変数 $michael の文字列結合を行い、参照してみましょう。    

(３)　変数 $hello と文字列 'ボブ' の文字列結合行い、参照してみましょう。    


<div style="page-break-before:always"></div>  
<br>  
<br>  



## 4 . 配列
### 1 . 配列

以下の値を格納する**配列型**の変数 **$fruits** を宣言してください。 
| 値 | 型 |
| ----- | ----- |
| 'バナナ' | 文字列型 |
| 'りんご' | 文字列型 |
| 'オレンジ' | 文字列型 |

(１)　変数  $fruits を参照してみましょう。

(２)　変数 $fruits内よりキーが2である値を参照してみましょう 。    

(３)　変数 $fruits内よりキーを指定し、値 'りんご' を参照してみましょう 。    

(４)　変数 $fruitsに、値 'さくらんぼ' を追加し、参照してみましょう 。

### 2 . 連想配列
以下のキーと対応した値を格納する**連想配列型**の変数 **$foods** を宣言してください。

| キー | 値 | 型 |
| ----- | ----- | ----- |
| '野菜'   | 'キャベツ' | 文字列型 |
| '肉'     | '牛肉' | 文字列型 |

(１)　変数 $foods を参照してみましょう。

(２)　変数 $foods 内より、キーが '肉' の値を参照してみましょう。  

(３)  変数 $foods に、キーが '主食' 、値が '白米' を追加し、変数 $foods を参照してみましょう。  


<div style="page-break-before:always"></div>  
<br>  
<br>  



### 3.  配列と連想配列の組み合わせ

以下の値を格納する**配列型**の変数 **$fruits** を宣言してください。 
| 値 | 型 |
| ----- | ----- |
| 'バナナ' | 文字列型 |
| 'りんご' | 文字列型 |
| 'オレンジ' | 文字列型 |

以下のキーと対応した値を格納する**連想配列型**の変数 **$foods** を宣言してください。

| キー | 値 | 型 |
| ----- | ----- | ----- |
| '野菜'   | 'キャベツ' | 文字列型 |
| '肉'     | '牛肉' | 文字列型 |

(１)  変数 $foods にキーが '果実' ,値が $fruits を追加し、変数 $foods を参照してみましょう。  
(２)  変数 $foods 内よりキーを指定し、値 'オレンジ' を参照してみましょう。  

## 5.  NULL
(１)  値が**NULL**の、変数 $null を宣言し、参照してみましょう。


<div style="page-break-before:always"></div>  
<br>  

---
>＊１.　型　は以上で完了です。

<div style="page-break-before:always"></div>  
<br>  



# ２.　制御文

次は値の判定や、処理を繰り返し行う書き方を学んでいきます。  
**制御文**は名前のごとく処理の制御を行います。  
処理と言うと難しく聞こえますが、値の宣言や計算、文字列結合も立派な処理です。  
ゆっくりでいいので、やっていることを理解しながらやっていきましょう。

## 条件分岐
まず始めに**条件分岐**を学習していきましょう。  
**特定の場合にのみ**処理を行いたかったり、**値によって行う処理を分けたい**場合に、  
条件分岐を使用します。

###  例）変数Aが１の時だけ処理を行う制御文
```php
if ($変数A ==１) {
    // 変数Aが１の時のみ、この{}内の処理が走る
}
```
分岐を行う場合には、**演算子を使用した式**を**条件として設定**していきます。    

上記の例では  
「変数Aが１の時」という**条件**を、  
「$変数A ==１」のような**式**に落とし込んでいますね。  

この過程は条件分岐を行う上でとても大事なことです。  
- 　まず、やりたいことを最小限の条件に切り分ける。  
- 　次に、それぞれの条件を式に落とし込む。  
のような順序でやっていくと理解が進むと思います。

では、先にこの**式の書き方**を学んでおきましょう。



<div style="page-break-before:always"></div>  
<br>  


## 比較演算子
---
**比較演算子**は**比較のための演算子**です。  
２つの値が等しいかどうかや、大きい小さいの判断に使用します。  
これらの式は**論理値型の値**を返却します。  

### 比較演算子を使用した式
```php
// 等しい	型の相互変換をした後で $a が $b に等しい時に TRUE。
$a == $b 

// 等しい	$a が $b に等しく、および同じ型である場合に TRUE 。
$a === $b 

//等しくない	型の相互変換をした後で $a が $b に等しくない場合に TRUE。
$a != $b  

// 等しくない	型の相互変換をした後で $a が $b に等しくない場合に TRUE。
$a <> $b 

// 等しくない	$a が $b と等しくないか、同じ型でない場合に TRUE 。
$a !== $b 

//より少ない	$a が $b より少ない時に TRUE。
$a < $b	 

// より多い	$a が $b より多い時に TRUE。
$a > $b	 

// より少ないか等しい	$a が $b より少ないか等しい時に TRUE。
$a <= $b 

// より多いか等しい　$a が $b より多いか等しい時に TRUE。
$a >= $b	
```



<div style="page-break-before:always"></div>  
<br>  


## 論理演算子
---
さらに、複雑な条件の指定が可能である**論理演算子**を学びます。  
これらも比較演算子の組み合わせで**論理値型の値**を返却します。  
### 比較演算子と論理演算子を使用した式
```php
// 論理積	$a および $b が共に TRUE の場合に TRUE
$a and $b

//論理和	$a または $b のどちらかが TRUE の場合に TRUE	
$a or $b

// 排他的論理和	$a または $b のどちらかが TRUE でかつ両方とも TRUE でない場合に TRUE
$a xor $b

//否定	$a が TRUE でない場合 TRUE 
! $a 

// 論理積	$a および $b が共に TRUE の場合に TRUE
$a && $b 

//論理和	$a または $b のどちらかが TRUE の場合に TRUE
$a || $b 
```

<div style="page-break-before:always"></div>  
<br>  


## 条件分岐の基本文法
条件の考え方が理解できたら、条件分岐の基本文法を学んでいきましょう。  
条件分岐には**2つ**の種類があります。  
- if
- switch  
少し複雑になってきますが、焦らずゆっくりやっていきましょう。



<div style="page-break-before:always"></div>  
<br>  



## if文
---
**if文**はもっともシンプルな分岐です。  
**特定の場合にのみ**処理を行うことができます。
### if文を使用した条件分岐
if文は以下のように書きます。
```php
if (式) {
    //式がTRUEの場合の処理
}
```
### if文を使用した条件分岐の例
if文は、まず**式**を評価します。  
この値が**TRUE**の場合のみ**処理が実行されます**。  
**FALSE**の場合には、処理の**実行は行われません**。

例として**比較演算子を使用**し、**数字A,数字Bの値**が**同じ場合**のみ、文字列に値を入れてみましょう。

```php
$number_A = 1;
$number_B = 1;
$word = '';

if ($number_A === $number_B) {
    $word = '２つの数字は同じです';
}

var_dump($word ; // ２つの数字は同じです

//　$number_A と $number_Bがの値が一致しない時には、''が入っている。
```


<div style="page-break-before:always"></div>  
<br>  


### 条件式に値を設定する
式には**論理値を返す値**を設定することができます。  
また、変数のみを設定した場合には、**暗黙の型変換**が行われます。  
試しにいろんな型の変数を作成し、式に設定してみましょう。

```php
//　整数型での例

if (1) {
    // 出力される
    print 'TRUE!';
}

if (’’) {
// 出力されない
print 'TRUE!';
}
```


<div style="page-break-before:always"></div>  
<br>  


>## 比較の際に注意すべき点
**暗黙の型変換**について注意すべき点があります。  
### 暗黙の型変換
下記の条件分岐ですがどうなるでしょうか？
```php
if (’’ == 0) {
    print '値は同じです';
}
```
これはなんと、分岐に入ってしまうのです。  
結果：
```
値は同じです //表示される
```
**0**,**""** , **null** などの値は、暗黙の型変換時に**FALSE**として扱われます。  
さらにこの比較では、比較演算子の **==** を使用しているので、**値のみ**の比較となり、値は同じと判断されてしまうのです。  
詳しくは、[型の相互変換](https://www.php.net/manual/ja/language.types.type-juggling.php)と
[比較について](https://www.php.net/manual/ja/types.comparisons.php)を参照してください。  

これを避けるためには、**値と型の比較**を行う **===** を使用しましょう。
```php
if (’’ === 0) {
    print '値は同じです';
}
```
結果：
```
// 何も表示されない
```





<div style="page-break-before:always"></div>  
<br>  



## else ( if文 )
---
**else**とは英語で **「それ以外の」** を意味します。  
その名の通り、if文で指定した **「特定の場合」以外の場合** の分岐を行うのが**else**です。  
elseではif文の**式がTRUEにならなかった場合**処理を行います。

### elseを含むif文を使用した条件分岐
elseを含むif文は、以下のように書きます。
```php
if (式) {
    //式がTRUEの場合の処理
} else {
    //式がFALSEの場合の処理
}
```
### elseを含むif文を使用した条件分岐の例
if文の例に記述を加えて
- **数字A,数字Bの値**が**同じ場合**のみ、文字列に「２つの数字は同じです」を入れる。
- **それ以外の時**には文字列に「２つの数字は違います」を入れる。

２つの条件で処理を書いてみましょう。
```php
$number_A = 1;
$number_B = 2;
$word = '';

if ($number_A === $number_B) {
    $word = '２つの数字は同じです';
} else {
    // $number_A と $number_B の値が一致しないのでelseの処理が実行される。
    $word = '２つの数字は違います';
}

var_dump($word ; // ２つの数字は違います
```



<div style="page-break-before:always"></div>  
<br>  



## elseif, else if ( if文 )
---
ここまでで、if文とelseを使用した
- 特定の場合のみ処理を実行する。
- それ以外の場合に処理を実行する。

はできるようになったと思います。  
では、さらに**複数の特定条件を指定できる**、**elseif**を学んでいきましょう。  
### elseifを含むif文を使用した条件分岐
elseifを含むif文は、以下のように書きます。
```php
if (式1) {
    //式1がTRUEの場合の処理
} elseif (式2) {
    //式2がTRUEの場合の処理
}
```
### else, elseifを含むif文を使用した条件分岐の例
では次に,else, elseif,を使用して
- 数字A,数字Bの値が同じ場合のみ、文字列に「２つの数字は同じです」を入れる。
- **数字Aが１の場合には、文字列に「数字Aは１です、Bは違います」を入れる**。
- それ以外の時には文字列に「２つの数字は違います」を入れる。

３つの条件で処理を書いてみましょう。
```php
$number_A = 1;
$number_B = 2;
$word = '';

if ($number_A === $number_B) {
    $word = '２つの数字は同じです';
} elseif ($number_A === 1) {
    // $number_Aが１なのでこの処理に入る
    $word = '数字Aは１です、Bは違います';
} else {
    $word = '２つの数字は違います';
}

var_dump($word ; // 数字Aは１です、Bは違います
```



<div style="page-break-before:always"></div>  
<br>  

>## if文についての補足
### if文の入れ子
if文は以下のように入れ子にすることができます。
```php
$number_A = 1;
$number_B = 1;
$word = '';

if ($number_A === $number_B) {
    // 数字が同じ場合
    $word = '数字は同じ値です';

    if ($number_A === 1) {
        // 数字が同じ場合 かつ $number_Aの値が1
        $word = '数字は同じ値 かつ 値は１です';
    }
}

var_dump($word ; //数字は同じ値 かつ 値は１です
```

### 論理演算子を使用した条件の書き換え
以下の条件分岐は同じ処理になります。
```php
$number_A = 1;
$number_B = 1;
$word_1 = '';
$word_2 = '';

// 比較演算子のみで条件分岐を行う場合
if ($number_A === $number_B) {
    // 数字が同じ場合
    if ($number_A === 1) {
        // $number_Aの値が1
        $word_1 = '数字は同じ値 かつ 値は１です';
    }
}

// 論理演算子を使用して条件分岐を行う場合
if ($number_A === $number_B and $number_A === 1) {
    // 数字が同じ場合 かつ $number_Aの値が1
    $word_2 = '数字は同じ値 かつ 値は１です';
}

var_dump($word_1 ; //数字は同じ値 かつ 値は１です
var_dump($word_2 ; //数字は同じ値 かつ 値は１です
```


<div style="page-break-before:always"></div>  
<br>  


# 練習課題 ）if文

現在、作成中...  
しばし、お待ちを...
 



<div style="page-break-before:always"></div>  
<br>  




## switch文
---
次は**switch文**です。  

switch文はif文と同じ、条件分岐文です。  
switch文は、**評価したい式の返却値**によって処理を分けることができます。  
では実際に書き方をみてみましょう。

### switch文の書き方
以下が基本文法です。  
その名の通り値に
```php
switch (式) {
    case 値１:
        // 式の返却値が値１の場合の処理 
        break;

    case 値２:
        // 式の返却値が値２の場合の処理
        break;

    case 値３:
        // 式の返却値が値３の場合の処理
        break;
}
```


