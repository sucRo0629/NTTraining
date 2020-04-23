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

# SQL 課題-解答

### 1.基本

#### 1-1.カラム名を記述せずに各飲食店のすべての情報を取得せよ

```sql
SELECT * FROM restaurant
```

#### 1-2.各飲食店の飲食店名、距離、所要時間を取得せよ

```sql
SELECT name, distance, time FROM restaurant
```

### 2.単純な検索

#### 2-1.飲食店 ID が 14 の飲食店を取得せよ

```sql
SELECT name FROM restaurant WHERE id = 14
```

#### 2-2.距離が 100m 以内の飲食店を取得せよ

```sql
SELECT name, distance FROM restaurant WHERE distance <= 100
```

#### 2-3.距離が 100m 以上 200m 以下の飲食店を BETWEEN 句を使って取得せよ

```sql
SELECT name, distance FROM restaurant
WHERE distance BETWEEN 100 AND 200
```

#### 2-4.距離が 3 番目と 4 番目に遠い飲食店を取得せよ

```sql
SELECT name, distance FROM restaurant
WHERE distance ORDER BY distance DESC LIMIT 2, 2
```

<div class="page">

#### 2-5.飲食店名に「麺」が含まれる飲食店を取得せよ

```sql
SELECT name FROM restaurant WHERE name LIKE '%麺%'
```

#### 2-6.飲食店名が「店」で終わる飲食店を取得せよ

```sql
SELECT name FROM restaurant WHERE name LIKE '%店'
```

#### 2-7.GROUP BY 以外の方法で、ジャンルに紐付いているすべてのジャンル ID を重複を省いて取得せよ

```sql
SELECT DISTINCT group_id FROM genre
```

### 3.結合

#### 3-1.ジャンルとグループの組み合わせをすべて取得せよ

```sql
SELECT genre.name, genre_group.name FROM genre
JOIN genre_group ON genre.group_id = genre_group.id
```

#### 3-2.どの飲食店にも設定されていないジャンルを取得せよ

```sql
SELECT genre.name, genre_of_restaurant.restaurant_id FROM genre
LEFT JOIN genre_of_restaurant
  ON genre.id = genre_of_restaurant.genre_id
WHERE genre_of_restaurant.restaurant_id IS NULL
```

#### 3-3.飲食店 ID が 8 の飲食店に付けられているジャンルを重複を省いてすべて取得せよ

飲食店名と飲食店 ID も取得すること

```sql
SELECT DISTINCT restaurant.id, restaurant.name, genre.name
FROM restaurant
JOIN genre_of_restaurant
  ON restaurant.id = genre_of_restaurant.restaurant_id
JOIN genre
  ON genre_of_restaurant.genre_id = genre.id
where restaurant.id = 8
```

<div class="page">

#### 3-4.「おかわり無料」のジャンルが設定されている飲食店で、最も近い飲食店を取得せよ

```sql
SELECT restaurant.id, restaurant.name, restaurant.distance, genre.name
FROM restaurant
JOIN genre_of_restaurant
  ON restaurant.id = genre_of_restaurant.restaurant_id
JOIN genre
  ON genre_of_restaurant.genre_id = genre.id
WHERE genre.name LIKE 'おかわり無料'
ORDER BY distance ASC LIMIT 1
```

#### 3-5.「豚骨」ジャンルが設定されている飲食店の数をカラムに別名を付けて取得せよ

```sql
SELECT genre.id, genre.name, COUNT(gor.restaurant_id) '店舗数'
FROM genre
JOIN genre_of_restaurant gor
  ON genre.id = gor.genre_id
GROUP BY genre.id HAVING genre.name LIKE '豚骨'
```

#### 3-6.ジャンル ID が 1 か 8 いずれかが設定された飲食店を重複を省いて取得せよ

```sql
SELECT DISTINCT restaurant.name
FROM restaurant
JOIN genre_of_restaurant
  ON restaurant.id = genre_of_restaurant.restaurant_id
JOIN genre
  ON genre_of_restaurant.genre_id = genre.id
WHERE genre.id IN(1, 8)
```

<div class="page">

#### 3-7.ジャンル ID が 1 と 8 いずれも設定された飲食店を取得せよ

```sql
SELECT restaurant.name
FROM restaurant
JOIN genre_of_restaurant
  ON restaurant.id = genre_of_restaurant.restaurant_id
JOIN genre
  ON genre_of_restaurant.genre_id = genre.id
WHERE genre_id IN(1, 8)
GROUP BY restaurant.id -- restaurant.nameでもできるが被らないIDが確実
 -- 指定したジャンルIDがすべて設定されている飲食店のレコード数は、
 -- 指定したジャンルIDの数と等しい
HAVING COUNT(*) = 2
```

#### 3-8.ジャンル ID が 1 か 8 いずれかが設定された飲食店を“除いた”飲食店を取得せよ

```sql
SELECT name FROM restaurant
WHERE id
NOT IN(
  SELECT DISTINCT restaurant_id
  FROM genre_of_restaurant
  WHERE genre_id IN(1, 8)
)
```
