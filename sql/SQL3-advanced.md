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

| カラム名 | 意味              | 型          | NULL |
| -------- | ----------------- | ----------- | ---- |
| id       | 社員 ID           | INT         | ×    |
| name     | 社員名            | VARCHAR(32) | ×    |
| dept_id  | 所属部署の部署 ID | INT         | ○    |

#### データ入力

| name    | dept_id |
| ------- | ------- |
| Alpha   | 1       |
| Bravo   | 2       |
| Charlie | 1       |
| Delta   | _NULL_  |

## AS

## テーブルの結合

複数のテーブルを結合し、結合後のテーブルから SELECT 文でデータを抽出することができる。結合方法には大きく分けて内部結合と外部結合がある。  
<br>
この項では作成しておいた deps テーブルと employee テーブルを使って説明する。  
これらのテーブルのポイントは以下の 2 点である。

- 技術部（dept_id=3）所属は存在しない
- Delta はどの部署にも所属していない（NULL）

### 内部結合

INNER JOIN 句を使うと内部結合が行える。  
内部結合は指定したカラムに対して、同じデータを持つレコード同士を結合させる。指定したカラムのデータがどちらかにしかない（同じデータがない）レコードは抽出されない。
INNER JOIN 句は「INNER」 を省略して「JOIN」とだけ書くこともできる。

#### 書式

```sql
SELECT 〈カラム名...〉 FROM 〈テーブル名1〉 [INNER] JOIN 〈テーブル名2〉
ON 〈テーブル名1〉.〈指定カラム名1〉 = 〈テーブル名2〉.〈指定カラム名2〉
```
指定するカラム名は分かりやすよう同じ名前にしていることがほとんどである。  
<br>
以下に例を示す。

```sql
SELECT * FROM employees INNER JOIN depts
ON employees.dept_id = depts.dept_id
```

この SQL は、employees テーブルのカラムに対し、「employees（社員） テーブルの dept_id と depts（部署） テーブルの dept_id が同じ depts テーブルのレコードを結合する」という意味である。  
<br>
以下にそれぞれのテーブルと実行結果を示す。  

| employees                                  | depts                                  | 実行結果                                   |
| ------------------------------------------ | -------------------------------------- | ------------------------------------------ |
| ![employees](img/03/2020-03-05-165455.png) | ![depts](img/03/2020-03-05-165530.png) | ![innerJoin](img/03/2020-03-05-164656.png) |

前述したとおり、dept_id が NULL の「Delta」と所属する employee が存在しない「技術部」は抽出されていない。

#### WHERE 句を使う方法

INNER JOIN 句を使わず、以下のようにWHERE 句を使って内部結合を行うこともできる。

```sql
SELECT * FROM employees, depts
WHERE employees.dept_id = depts.depts_id
```

### 外部結合
外部結合の場合、内部結合と違い、どちらかのテーブルにしか存在しないレコードも取得する。  
外部結合には以下の3つがある。

- LEFT OUTER JOIN：左側のテーブルの内容を全て抽出する
- RIGHT OUTER JOIN：右側のテーブルの内容を全て抽出する
- FULL OUTER JOIN：両方のテーブルの内容を全て抽出する

左側、右側というのはJOIN句を中心として見たSQL文上の左右を意味する。  
なお、「OUTER」は省略できる。


## サブクエリ

## 集計関数

## GROUP BY

## HAVING

## insert 文

## update 文

## delete 文
