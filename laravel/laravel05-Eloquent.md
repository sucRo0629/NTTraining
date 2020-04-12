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

# Laravel 資料 5 　 Eloquent

## 導入

本資料では Laravel での SQL の発行について Eloquent を使用してログインページにユーザ登録・更新・削除機能を実装しながら説明を行う。

資料 3 での Eloquent の説明再掲

> Eloquent（エロクエント［発音記号：éləkwənt］）とは Laravel の提供する ORM である。  
> ORM（Object-relational mapping：オブジェクト関係マッピング）は、DB のレコードをオブジェクトとして直感的に扱えるようにする仕組みで、これにより SQL を意識することなく DB との連携が書けるというのがメリットである。

Laravel の DB 操作の方法には Eloquent の他に、DB ファサードを使用する方法も存在する。  
DB ファサードの場合の基本的な操作は資料末尾に付録として示す。

本資料は以下の手順で実装を行っていく。

1. ルーティング追加
1. ビュー作成
1. コントローラ作成
1. 実装
   1. ユーザ登録
   1. ユーザ一覧
   1. ユーザ更新
   1. ユーザ削除

## ユーザ登録ページの作成

資料 3 の DB 連携では phpMyAdmin で SQL を実行することでユーザ登録を行ったが、ページ側から登録できるようユーザ登録ページを作成する。

### ルーティング追加

登録ページ用のルーティングを設定する。

【routes\web.php】

```diff
  <?php

  Route::get('/login', 'LoginController@getIndex');
  Route::post('/login', 'LoginController@postIndex');
+ Route::get('/create', 'LoginController@create');
```

### コントローラー作成

`LoginController`に以下のように`create`メソッドを追加する。

【app\Http\Controllers\LoginController.php】

```php
（略）

  function create()
  {
    return view('login/create');
  }

（略）
```

### ビューの作成
登録ページのビュー`create.blade.php`を`login`ディレクトリに作成する。

これ以降もビューは`resources\views\login\`ディレクトリ下に作成していく。

【resources\views\login\create.blade.php】

```html

```


## ユーザ一覧ページの作成

### ルーティング追加

### ビューの作成

既存のログイン結果ページ（result.blade.php）を削除し、新規にユーザ一覧ページを作成する。

【list.blade.php】

```html

```

## ログイン成功後のページ変更

## ユーザ更新ページの作成

### ビューの作成

### ルーティング追加

### コントローラー作成

## ユーザ削除ページの作成

### ビューの作成

### ルーティング追加

### コントローラー作成

ログイン成功しなければ
