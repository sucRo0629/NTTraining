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

# SQL チュートリアル - SELECT 文の基本

## 導入

SQL とは

DB に対して検索を行い、データを抽出するのが SELECT 文である。
CRUD（クラッド）の R（**R**ead）に当たる操作であり、最も使用頻度が高い。
CRUD とは DB と連携するアプリケーションの持つ基本機能の頭文字を並べたもので、SQL との対応は以下の表のようになっている。
|基本機能|SQL|操作|
|---|---|---|
|Create|INSERT|追加（生成）|
|Read|SELECT|検索（読取）|
|Update|UPDATE|更新|
|Delete|DELETE|削除|

本資料内では基本的な SELECT 文についてチュートリアルを行い、発展的な SELECT 文とその他のデータ操作については別の資料で触れる。

## チュートリアル用のテーブル作成

以下のテーブルを作成する。以降のチュートリアルでは特に記述がない限りこのテーブルに対して SQL を発行していく。
DB については任意の DB 名で別紙の phpMyAdmin の資料で説明した通りに作成していれば問題ない。

### books テーブル

| カラム名 | 型          | NULL | その他                               |
| -------- | ----------- | ---- | ------------------------------------ |
| title_id | INT         | ×    | オートインクリメント、プライマリキー |
| title    | VARCHAR(32) | ×    | -                                    |
| pages    | INT         | ×    | -                                    |

#### 入力データ
以下のSQLを実行
```sql
```

## 基本的な SELECT 文

### 書式

括弧内を適宜書き換えていく。

```sql
SELECT ［列名, 列名, 列名,...］ FROM ［テーブル名］ ［検索条件］
```

### 全件取得

カラム名を「\*」（アスタリスク）にすると、すべての列が選択される。

```sql
SELECT * FROM books
```

### カラム名を指定して取得

## 条件付きの SELECT 文

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
