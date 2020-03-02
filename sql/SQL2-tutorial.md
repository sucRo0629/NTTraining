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

# SQL チュートリアル - SELECT文の基本

## 導入
SQLとは

DBに対して検索を行い、データを抽出するのがSELECT文である。
CRUD（クラッド）のR（**R**ead）に当たる操作であり、最も使用頻度が高い。
CRUDとはDBと連携するアプリケーションの持つ基本機能の頭文字を並べたもので、SQLとの対応は以下の表のようになっている。
|基本機能|SQL|操作|
|---|---|---|
|Create|INSERT|追加（生成）|
|Read|SELECT|検索（読取）|
|Update|UPDATE|更新|
|Delete|DELETE|削除|

本資料内では基本的なSELECT文についてチュートリアルを行い、発展的なSELECT文とその他のデータ操作については別の資料で触れる。

## チュートリアル用のテーブル作成

以下のテーブルを作成する。以降のチュートリアルでは特に記述がない限りこのテーブルに対してSQLを発行していく。
DBについては任意のDB名で別紙のphpMyAdminの資料と同様に作成していれば問題ない。

## 基本的なSELECT文
### 書式
括弧内を適宜書き換えていく。
```sql
SELECT ［列名, 列名, 列名,...］ FROM ［テーブル名］ ［検索条件］
```
### 全件取得
カラム名を「*」（アスタリスク）にすると、すべての列が選択される。
```sql
SELECT * FROM testtest
```
### カラム名を指定して取得

## 条件付きのSELECT文
### WHERE
### 比較演算子
### AND、OR
### BETWEEN、IN
### LIKE
### 結果のフィルタとソート
1. select 文
   1. カラム指定して取得
   1. すべての情報を取得
   1. WHERE
   1. 比較演算子
   1. AND、OR
   1. BETWEEN、IN
   1. LIKE
   1. 結果のフィルタ・ソート
1. select 文振り返り問題
1. テーブルの結合
   1. LEFT JOIN
   1. RIGHT JOIN
   1. FULL JOIN
   1. NULL
1. insert 文
1. update 文
1. delete 文
