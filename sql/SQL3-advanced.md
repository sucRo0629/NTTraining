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

# SQL チュートリアル - 発展

## チュートリアル用のテーブル作成

基礎のチュートリアルで作成した books テーブルはこのチュートリアルでも引き続き使用する。

テーブル結合の説明用にシンプルなテーブルを 2 つ用意する。

### depts テーブル

dept_id にプライマリーキーとオートインクリメントを設定する。

| カラム名 | 意味    | 型          | NULL |
| -------- | ------- | ----------- | ---- |
| dept_id  | 部署 ID | INT         | ×    |
| name     | 部署名  | VARCHAR(32) | ×    |

#### データ入力

| name   |
| ------ |
| 営業部 |
| 総務部 |
| 技術部 |

### employees テーブル

id にプライマリキーとオートインクリメントを設定する。

| カラム名 | 意味    | 型          | NULL |
| -------- | ------- | ----------- | ---- |
| id       | 社員 ID | INT         | ×    |
| name     | 社員名  | VARCHAR(32) | ×    |
| dept_id  | 部署 ID | INT         | ○    |

#### データ入力

| name    | dept_id |
| ------- | ------- |
| Alpha   | 1       |
| Bravo   | 2       |
| Charlie | 1       |
| Delta   | _NULL_  |

## テーブルの結合
複数のテーブルを結合し、結合後のテーブルからSELECT文でデータを抽出することができる。結合方法には大きく分けて内部結合と外部結合がある。  
<br>
この項では作成しておいたdepsテーブルとemployeeテーブルを使って説明する。  
これらのテーブルのポイントは以下の2点である。  

- 技術部（dept_id=3）所属は存在しない
- Deltaはどの部署にも所属していない

### 内部結合


### 外部結合

## サブクエリ

## 集計関数

## AS

## GROUP BY

## HAVING

## insert 文

## update 文

## delete 文
