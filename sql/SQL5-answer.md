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

#### 1.カラム名を記述せずに各飲食店のすべての情報を取得せよ

```sql
SELECT * FROM restaurant
```

#### 2.各飲食店の飲食店名、距離、所要時間を取得せよ

```sql
SELECT name, distance, time FROM restaurant
```

### 2.単純な検索

#### 1.飲食店 ID が 14 の飲食店を取得せよ

```sql
SELECT name FROM restaurant WHERE id = 14
```

#### 2.距離が 100m 以内の飲食店を取得せよ

```sql
SELECT name, distance FROM restaurant WHERE distance <= 100
```

#### 3.距離が 100m 以上 200m 以下の飲食店を BETWEEN 句を使って取得せよ

```sql
SELECT name, distance FROM restaurant
WHERE distance BETWEEN 100 AND 200
```

#### 4.距離が 3 番目と 4 番目に遠い飲食店を取得せよ

```sql
SELECT name, distance FROM restaurant
WHERE distance ORDER BY distance DESC LIMIT 2, 2
```

#### 5.飲食店名に「麺」が含まれる飲食店を取得せよ

```sql
SELECT name FROM restaurant WHERE name LIKE '%麺%'
```

#### 6.飲食店名が「店」で終わる飲食店を取得せよ

```sql
SELECT name FROM restaurant WHERE name LIKE '%店'
```
#### 7.GROUP BY 以外の方法で、ジャンルに紐付いているすべてのジャンル ID 重複を省いてを取得せよ

```sql
SELECT DISTINCT group_id FROM genre
```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```
