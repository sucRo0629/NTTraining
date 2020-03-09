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

新たにシンプルなテーブルを 2 つ用意する。

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

INNER JOIN 句を使わず、以下のように WHERE 句を使って内部結合を行うこともできる。

```sql
SELECT * FROM employees, depts
WHERE employees.dept_id = depts.depts_id
```

### 外部結合

外部結合の場合、内部結合と違い、どちらかのテーブルにしか存在しないレコードも取得する。  
外部結合には以下の 2 つがある。

- LEFT OUTER JOIN：左側のテーブルの内容を全て抽出する
- RIGHT OUTER JOIN：右側のテーブルの内容を全て抽出する

左側、右側というのは JOIN 句を中心として見た SQL 文上の左右を意味する。  
なお、「OUTER」は省略できる。

以下に例を示す。

#### LEFT JOIN

```sql
SELECT * FROM employees LEFT JOIN depts
ON employees.dept_id = depts.dept_id
```

実行結果  
![leftJoin](img/03/2020-03-06-100437.png)

「Delta」が抽出されており、「技術部」は抽出されていない。

#### RIGHT JOIN

```sql
SELECT * FROM employees RIGHT JOIN depts
ON employees.dept_id = depts.dept_id
```

実行結果  
![rightJoin](img/03/2020-03-06-100904.png)

「技術部」が抽出されており、「Delta」は抽出されていない。

### USING

結合を行う際、結合条件として指定するカラム名がそれぞれのテーブルで同じ場合、USING 句を使って書くこともできる。  
以下の 2 つの SQL は同じ意味である。

```sql
SELECT * FROM employees JOIN depts USING(dept_id)
SELECT * FROM employees JOIN depts ON employees.dept_id = depts.dept_id
```

## 集計関数

集計関数を使うことで演算を行うことができる。  
<br>
集計関数一覧  
|関数名|機能|
|---|---|
|MAX|最大値|
|MIN|最小値|
|SUM|合計|
|AVG|平均値|
|COUNT|個数のカウント|

「`集計関数（カラム名）`」のように書いて使用する。  
<br>
以下に例を示す。

#### ページ数（pages）の平均を表示する

```sql
SELECT AVG(pages) FROM books
```

実行結果  
![avg](img/03/2020-03-06-143701.png)

#### ページ数の最大値と最小値を表示する

```sql
SELECT MAX(pages), MIN(pages) FROM books
```

## GROUP BY

GROUP BY 句でカラム名を指定すると、指定したカラムの値が同じデータをグループとしてまとめて扱う。  
グループ化した場合、抽出される単位もグループ単位となる。

以下に例を示す。

#### 判型でグループ化

```sql
SELECT * FROM books GROUP BY size
```

実行結果  
![groupBy](img/03/2020-03-06-175524.png)
それぞれの判型で title_id が最も小さいフィールドのみ抽出されている。  
通常はこの例のように全カラムの抽出はせず、カテゴリごとに集計したい場合などに GROUP BY 句を使うことが多い。

#### 判型ごとの冊数とページ数平均を表示

```sql
SELECT size, COUNT(size), AVG(pages) FROM books GROUP BY size
```

実行結果  
![groupBy2](img/03/2020-03-06-182116.png)

## AS

AS 句を使うことでカラムやテーブルに別名を付けることができる。

```sql
〈元の名前〉 AS 〈別名〉
```

AS 句は省略して以下のように書ける。

```sql
〈元の名前〉〈空白〉〈別名〉
```

<br>
以下に例を示す。

#### テーブルに別名を付ける

```sql
SELECT e.name, d.name FROM employees e
INNER JOIN depts d ON e.dept_id = d.dept_id
```

実行結果  
![as](img/03/2020-03-06-182500.png)

#### 判型ごとの冊数とページ数平均を表示（カラム名設定）

```sql
SELECT size AS '判型', COUNT(size) AS '冊数', AVG(pages) AS 'ページ数の平均'
FROM books GROUP BY size
```

実行結果  
![as2](img/03/2020-03-06-182637.png)

## HAVING

HAVING 句も WHERE 句と同じく検索条件を指定する SQL である。
WHERE 句との違いは評価順序が GROUP BY 句よりも先か後かという点である。
以下に SELECT 文における評価順序を示す。

1. FROM
1. ON
1. JOIN
1. **WHERE**
1. GROUP BY
1. **HAVING**
1. SELECT
1. DISTINCT
1. ORDER BY
1. LIMIT

- WHERE:グループ化される前に条件を適応
- HAVING:グループ化された後に条件を適応

HAVING句の場合、集計関数と併用されることが多い。
以下に例を示す。

#### 5冊以上の判型を抽出
```sql
SELECT size, COUNT(size) FROM books GROUP BY size HAVING COUNT(size) >= 5
```

実行結果  
![having](img/03/2020-03-09-130327.png)

## サブクエリ

サブクエリとは、あるクエリの中に含まれるもう一つのクエリである。
何度かクエリを実行しないと得られない結果を一度で得たいときに使われる。
<br>
サブクエリで抽出した結果をメインのクエリの検索条件とする例を以下に示す。
```sql
SELECT name FROM employees
WHERE dept_id = (SELECT dept_id FROM depts where name like '営業%')
```

実行結果  
![subQuery](img/03/2020-03-09-151445.png)

「営業」から始まる部署に所属する社員が抽出される。
外側のWHEREの条件が「=」のため、サブクエリの結果が2行以上の場合はエラーになる。
以上以下など、条件が範囲をとる場合はエラーは出ない。

なお、上記の例は結合（JOIN句）を使って書くこともできる。
```sql
SELECT employees.name FROM employees JOIN depts
ON employees.dept_id = depts.dept_id
WHERE depts.name like '営業%'
```

## insert 文

## update 文

## delete 文
