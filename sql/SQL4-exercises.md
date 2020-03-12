<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<style>
  a::after {
    padding: 0 4px;
    content: "\f35d";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    font-size: 0.8rem;
  }
  @media print {
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
    color: #f66;
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

# SQL 課題

## 課題用のテーブル作成

筆者が過去に研修課題で作成したシステムのテーブルの一部を使用する。  
以下の SQL を実行する。

```sql

```

## テーブル定義

### 飲食店マスタ

表名：restaurant
|列名<br>（論理）|列名<br>（物理）|データ型|長さ|必須|主キー|備考|
|-|-|-|-|-|-|-|
|飲食店 ID|id|INT|11|Yes|○||
|飲食店名|name|VARCHAR|30|Yes|||
|緯度|lat|DOUBLE|8,6|Yes|||
|経度|lng|DOUBLE|9,6|Yes|||
|距離|distance|INT|5|Yes||単位：メートル|
|所要時間|time|INT|2|Yes||単位：分|
|利用回数|use_count|INT|3|Yes|||

※time は SQL の予約語と被っているため、あまりよくない名前

### ジャンルマスタ

表名：genre
|列名<br>（論理）|列名<br>（物理）|データ型|長さ|必須|主キー|備考|
|-|-|-|-|-|-|-|
|ジャンル ID|id|INT|11|Yes|○||
|ジャンル名|name|VARCHAR|15|Yes|||
|所属グループ|group_id|11|Yes||||

### グループマスタ

表名：genre_group
|列名<br>（論理）|列名<br>（物理）|データ型|長さ|必須|主キー|備考|
|-|-|-|-|-|-|-|
|グループ ID|id|INT|11|Yes|○|||
|グループ名|name|VARCHAR|15|Yes||||

### 飲食店のジャンル

表名：genre_of_restaurant
|列名<br>（論理）|列名<br>（物理）|データ型|長さ|必須|主キー|備考|
|-|-|-|-|-|-|-|
|中間テーブル ID|id|INT|11|Yes|○||||
|飲食店 ID|restaurant_id|INT|11|Yes|||||
|ジャンル ID|genre_id|INT|11|Yes|||||

### 用語の補足

#### ジャンル

その飲食店で扱っているメニューのジャンル。  
ジャンルは必ずひとつのグループに所属する。  
ひとつの飲食店はひとつ以上のジャンルを持つ。  
（ジャンルの例：ラーメン、和食、肉料理、こってり、辛い）

#### グループ

共通する要素を持つジャンルをまとめたもの。  
ジャンルの親要素にあたる。

<div class="page">

## 課題

各課題は問題文実と正答実行時の結果画像の組み合わせで示す。  
問題文においてカラム名が特に指定されていない場合、原則として実行結果と同じカラムを取得することとする。  
ただし、考え方と挙動を理解している限りにおいてはあまり気にしなくて構わない。

### 1.基本

#### 1.カラム名を記述せずに各飲食店のすべての情報を取得せよ

実行結果省略

#### 2.各飲食店の飲食店名、距離、所要時間を取得せよ

実行結果  
![1-2](img/04/2020-03-12-142851.png)

### 2.単純な検索

#### 1.飲食店 ID が 14 の飲食店を取得せよ

実行結果  
![2-1](img/04/2020-03-12-144804.png)

#### 2.距離が 100m 以内の飲食店を取得せよ

実行結果  
![2-2](img/04/2020-03-12-145009.png)

#### 3.距離が 100m 以上 200m 以下の飲食店を BETWEEN 句を使って取得せよ

実行結果  
![2-3](img/04/2020-03-12-150439.png)

#### 4.距離が 3 番目と 4 番目に遠い飲食店を取得せよ

実行結果  
![2-4](img/04/2020-03-12-150953.png)

#### 5.飲食店名に「麺」が含まれる飲食店を取得せよ

実行結果  
![2-5](img/04/2020-03-12-151328.png)

#### 6.飲食店名が「店」で終わる飲食店を取得せよ

実行結果  
![2-6](img/04/2020-03-12-151811.png)

#### 7.GROUP BY 以外の方法で、ジャンルに紐付いているすべてのジャンル ID 重複を省いてを取得せよ

実行結果  
![2-7](img/04/2020-03-12-152506.png)

### 3.結合

#### ジャンルとグループの組み合わせをすべて取得せよ

#### どの飲食店にも設定されていないジャンルを取得せよ

join とサブクエリ多めで
