<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .aa{
            margin-left: auto;
            margin-right: auto;
        }
        .custom-list {
         list-style-type: none; /* 移除點點 */
        padding: 0;
        }

        .custom-list li:before {
        list-style-type: none;
        content: "\00B7"; /* Unicode 中的空白點 */
        margin-right: 8px; /* 加上一些間距 */
        }

        .rating {
            font-size: 30px;
            color: #ccc;
            cursor: pointer;
        }
        
        .star {
            display: inline-block;
            transition: color 0.3s;
        }
        
        .star:hover,
        .star.active {
            color: gold;
        }
        .infor{
          margin-left: auto;
          margin-right: auto;
        }
        .comment{
          margin-left: 15%;
        }
        .comment_1{
          margin-right: 100%;
        }
        .comment_text{
          text-align: center;
        }
        .send{
          text-align: center;
        }
        .ee{
          background-color: beige;
        }


    </style>
</head>
<body>
  <section>
  <table class="infor">
    <tr>
      <td>
        <img class="pp" src="image/111111.jpg" width="350px" height="400px">
      </td>
      <td>
        <ul>
          <li><h3>商品名稱</h3></li>
          <li><h3>規格說明<br>  <br>含水量:<br>  <br>基弧:<br>  <br>鏡片直徑:<br>  <br>著色直徑:<br></h3></li>
        </ul>
      </td>
    </tr>

  </table>
</section>
<section class="oo">
  <table class="comment">
    <tr>
      <td class="ee">
        <h3 class="comment_text">留言板</h3><br>
        <h3>請輸入姓名:</h3><input type="text"><br>
        <h3>   </h3>
        <h3>請對商品評分</h3>
        <span class="star" data-rating="1">&#9733;</span>
        <span class="star" data-rating="2">&#9733;</span>
        <span class="star" data-rating="3">&#9733;</span>
        <span class="star" data-rating="4">&#9733;</span>
        <span class="star" data-rating="5">&#9733;</span><br>
        <h3>   </h3>
        <h3>請給予我們您的寶貴意見:</h3><textarea name="" id="" cols="50" rows="5"></textarea><br>
        <h3>    </h3>
        <button class="send">送出</button>
      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>

      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td>
        
      </td>
      <td class="ee">
        <h3 class="comment_text">顧客回饋</h3>
        <h4>林0珊</h4><span class="star" data-rating="1">&#9733;</span>
        <span class="star" data-rating="2">&#9733;</span>
        <span class="star" data-rating="3">&#9733;</span>
        <span class="star" data-rating="4">&#9733;</span>
        <span class="star" data-rating="5">&#9733;</span><br>
        <h5><p>含水量38%真是太棒了，讓我可以長時間戴著而不感到乾澀。</p></h5>
        <h4>周0穎</h4><span class="star" data-rating="1">&#9733;</span>
        <span class="star" data-rating="2">&#9733;</span>
        <span class="star" data-rating="3">&#9733;</span>
        <span class="star" data-rating="4">&#9733;</span>
        <span class="star" data-rating="5">&#9733;</span><br>
        <h5><p>含水量38%真是太棒了，讓我可以長時間戴著而不感到乾澀。</p></h5>
        <h4>彭0祐</h4><span class="star" data-rating="1">&#9733;</span>
        <span class="star" data-rating="2">&#9733;</span>
        <span class="star" data-rating="3">&#9733;</span>
        <span class="star" data-rating="4">&#9733;</span>
        <span class="star" data-rating="5">&#9733;</span><br>
        <h5>含水量38%真是太棒了，讓我可以長時間戴著而不感到乾澀。</h5>
  
      </td>

    </tr>
  </table>
</section>
    <script>
         const stars = document.querySelectorAll('.star');
const ratingValue = document.getElementById('rating-value');

let rating = 0;

stars.forEach(star => {
  star.addEventListener('click', () => {
    rating = parseInt(star.getAttribute('data-rating'));
    updateRating();
  });

  star.addEventListener('mouseover', () => {
    resetStarsColor();
    highlightStars(parseInt(star.getAttribute('data-rating')));
  });

  star.addEventListener('mouseout', () => {
    resetStarsColor();
    highlightStars(rating);
  });
});

function highlightStars(count) {
  for (let i = 0; i < count; i++) {
    stars[i].classList.add('active');
  }
}

function resetStarsColor() {
  stars.forEach(star => {
    star.classList.remove('active');
  });
}

function updateRating() {
  ratingValue.innerHTML = `你的評分是：${rating}顆星`;
}

    </script>
</body>
</html>