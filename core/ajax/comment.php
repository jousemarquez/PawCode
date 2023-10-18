<?php 
	include '../init.php';
	$user_id = $_SESSION['user_id'];
	
	if(isset($_POST['qoute']) && !empty($_POST['qoute'])){
		$tweet_id  = $_POST['qoute'];
		$get_id    = $_POST['user_id'];
		$comment   = User::checkInput($_POST['comment']);
		$datePattern = "Y-m-d H:i:s";
        date_default_timezone_set("Europe/Madrid");

			$data = [
				'user_id' => $_SESSION['user_id'] ,
                'post_id' => $tweet_id , 
                'comment' => $comment , 
				'time' => date($datePattern) ,
			];
		    if ($comment != '') {
				$for_user = Tweet::getData($tweet_id)->user_id;
		
					if($for_user != $user_id) {
						$data_notify = [
						'notify_for' => $for_user ,
						'notify_from' => $user_id ,
						'target' => $tweet_id , 
						'type' => 'comment' ,
						'time' => date($datePattern) ,
						'count' => '0' , 
						'status' => '0'
						];
				
						Tweet::create('notifications' , $data_notify);
						
					} 

		     User::create('comments' , $data);

			}
	}

	if(isset($_POST['reply']) && !empty($_POST['reply'])){
		$tweet_id  = $_POST['reply'];
		$get_id    = $_POST['user_id'];
	
		$comment   = User::checkInput($_POST['comment']);

			date_default_timezone_set("Europe/Madrid");
          
		
			$data = [
				'user_id' => $_SESSION['user_id'],
                'comment_id' => $tweet_id,
                'reply' => $comment,
				'time' => date($datePattern),
			];
		    if ($comment != '') {
				// notification
				$for_user = Tweet::getComment($tweet_id)->user_id;
				$target = Tweet::getComment($tweet_id)->post_id;
		
				if($for_user != $user_id) {
					$data_notify = [
					'notify_for' => $for_user,
					'notify_from' => $user_id,
					'target' => $target,
					'type' => 'reply',
					'time' => date($datePattern),
					'count' => '0',
					'status' => '0'
					];
			
					Tweet::create('notifications' , $data_notify);
					
				}
				
		     User::create('replies' , $data);
			}
	}
        // Comment on Post popup
	if(isset($_POST['showPopup']) && !empty($_POST['showPopup'])){
		$tweet_id   = $_POST['showPopup'];
		$user       = User::getData($user_id);
		$retweet_comment = false;
		$qoq = false;
		if (Tweet::isRetweet($tweet_id)) {
		$retweet =Tweet::getRetweet($tweet_id);
		if ($retweet->retweet_id == null) {
				
			if ($retweet->retweet_msg != null) {

                $user_tweet = User::getData($retweet->user_id) ;
				 $timeAgo = Tweet::getTimeAgo($retweet->post_on) ; 
				 $qoute = $retweet->retweet_msg;
                 $retweet_comment = true;
           

              $tweet_inner = Tweet::getTweet($retweet->tweet_id);
              $user_inner_tweet = User::getData($tweet_inner->user_id) ;
              $timeAgo_inner = Tweet::getTimeAgo($tweet_inner->post_on); 


			} else {

				$tweet      = Tweet::getTweet($retweet->tweet_id);
		    	$user_tweet = User::getData($tweet->user_id);
		    	$timeAgo = Tweet::getTimeAgo($tweet->post_on) ; 
			}

		} else {
		
			if ($retweet->retweet_msg == null) {
				
				$retweeted_tweet = Tweet::getRetweet($retweet->retweet_id);

				if($retweeted_tweet->tweet_id != null) {
						$user_tweet = User::getData($retweeted_tweet->user_id) ;
						$timeAgo = Tweet::getTimeAgo($retweeted_tweet->post_on) ; 

						$retweet_inner = Tweet::getRetweet($retweet->retweet_id);

						$qoute = $retweet_inner->retweet_msg;
						$retweet_comment = true;
				

					
					$tweet_inner = Tweet::getTweet($retweet_inner->tweet_id);
					$user_inner_tweet = User::getData($tweet_inner->user_id) ;
					$timeAgo_inner = Tweet::getTimeAgo($tweet_inner->post_on); 

				} else {

					    $user_tweet = User::getData($retweeted_tweet->user_id) ;
						$timeAgo = Tweet::getTimeAgo($retweeted_tweet->post_on) ; 

						$retweet_inner = Tweet::getRetweet($retweet->retweet_id);

						$qoute = $retweet_inner->retweet_msg;
						$retweet_comment = true;
				        $qoq = true;

					
					$tweet_inner = Tweet::getRetweet($retweeted_tweet->retweet_id);
					$user_inner_tweet = User::getData($tweet_inner->user_id) ;
					$timeAgo_inner = Tweet::getTimeAgo($tweet_inner->post_on); 
                    $inner_qoute = $tweet_inner->retweet_msg;

				}
			} else {

				$user_tweet = User::getData($retweet->user_id) ;
				$timeAgo = Tweet::getTimeAgo($retweet->post_on) ; 
				$qoute = $retweet->retweet_msg;
				$qoq = true; // stand for qoute of qoute
				
				$tweet_inner = Tweet::getRetweet($retweet->retweet_id);
				$user_inner_tweet = User::getData($tweet_inner->user_id) ;
				$timeAgo_inner = Tweet::getTimeAgo($tweet_inner->post_on);
				$inner_qoute = $tweet_inner->retweet_msg;
			}
			
		}

	} else {


		$tweet = Tweet::getTweet($tweet_id);
		$user_tweet = User::getData($tweet->user_id);
		$timeAgo = Tweet::getTimeAgo($tweet->post_on);
	}
	
?>

<div class="retweet-popup">
<div class="wrap5">
	<div class="retweet-popup-body-wrap">
		<div class="retweet-popup-heading">
			<h3>Reply Tweet</h3>
			<span><button class="close-retweet-popup"><i class="fa fa-times" aria-hidden="true"></i></button></span>
		</div>
		<div class="retweet-popup-input">
			<div class="retweet-popup-input-inner">
				<input  class="retweet-msg" type="text" placeholder="Add Comment.."/>
			</div>
		</div>
		
				
		<div class="grid-tweet py-2">
              <div>
                <img
                  src="assets/images/users/<?php echo $user_tweet->img; ?>"
                  alt=""
                  class="img-user-tweet"
                />
              </div>
  
              <div>
                <p>
                  <strong> <?php echo $user_tweet->name ?> </strong>
                  <span class="username-twitter">@<?php echo $user_tweet->username ?> </span>
                  <span class="username-twitter"><?php echo $timeAgo ?></span>
                </p>
                <p>
				<?php
                  
                  if ($retweet_comment || $qoq)
                  echo  Tweet::getTweetLinks($qoute);
                  else echo  Tweet::getTweetLinks($tweet->status); ?>
				</p>
				
				<?php if ($retweet_comment == false && $qoq == false) { ?>
                <?php if ($tweet->img != null) { ?>
                <p class="mt-post-tweet">
                  <img
                    src="assets/images/tweets/<?php echo $tweet->img; ?>"
                    alt=""
                    class="img-post-retweet"
                  />
                </p>
			   <?php } ?>
			   <?php }  else { ?>

				<div  class="mt-post-tweet comment-post">

				<div class="grid-tweet py-3  ">
				<div>
				<img
				src="assets/images/users/<?php echo $user_inner_tweet->img; ?>"
				alt=""
				class="img-user-tweet"
				/>
				</div>

				<div>
				<p>
				<strong> <?php echo $user_inner_tweet->name ?> </strong>
				<span class="username-twitter">@<?php echo $user_inner_tweet->username ?> </span>
				<span class="username-twitter"><?php echo $timeAgo_inner ?></span>
				</p>
				<p>
				<?php 
				    if ($qoq)
                    echo $inner_qoute;
                    else  echo  Tweet::getTweetLinks($tweet_inner->status); ?>
				</p>
				<?php
				if($qoq == false) {
				if ($tweet_inner->img != null) { ?>
				<p class="mt-post-tweet">
				<img
				src="assets/images/tweets/<?php echo $tweet_inner->img; ?>"
				alt=""
				class="img-post-retweet"
				/>
				</p>
         <?php } } ?>

</div>
</div>
	   

</div>

<?php } ?>
			   

	</div>
</div>


		<div class="retweet-popup-footer"> 
			<div class="retweet-popup-footer-right">
				<button class="comment-it" 
				data-tweet="<?php echo $tweet_id;?>"
				data-user="<?php echo $user_id;?>"
				data-tmp="<?php echo $retweet_comment; ?>" 
				data-qoq="<?php echo $qoq; ?>" 
			 type="submit"><i class="fas fa-pencil-alt" aria-hidden="true"></i>Reply</button>
			</div>
		</div> 
		

</div>

<?php }

// Repling to comment popup

if(isset($_POST['showReply']) && !empty($_POST['showReply'])){
	$comment_id   = $_POST['showReply'];
	$user       = User::getData($user_id);
	

	$tweet      = Tweet::getComment($comment_id);
	$user_tweet = User::getData($tweet->user_id);
	$timeAgo = Tweet::getTimeAgo($tweet->time) ; 

?>
<div class="retweet-popup">
<div class="wrap5">
<div class="retweet-popup-body-wrap">
	<div class="retweet-popup-heading">
		<h3>Reply Comment</h3>
		<span><button class="close-retweet-popup"><i class="fa fa-times" aria-hidden="true"></i></button></span>
	</div>
	<div class="retweet-popup-input">
		<div class="retweet-popup-input-inner">
			<input  class="retweet-msg" type="text" placeholder="Add Reply.."/>
		</div>
	</div>
	
			
	<div class="grid-tweet py-2">
		  <div>
			<img
			  src="assets/images/users/<?php echo $user_tweet->img; ?>"
			  alt=""
			  class="img-user-tweet"
			/>
		  </div>

		  <div>
			<p>
			  <strong> <?php echo $user_tweet->name ?> </strong>
			  <span class="username-twitter">@<?php echo $user_tweet->username ?> </span>
			  <span class="username-twitter"><?php echo $timeAgo ?></span>
			</p>
			<p>
			<?php
			  
			   echo  Tweet::getTweetLinks($tweet->comment); ?>
			</p>

</div>
</div>
   
	<div class="retweet-popup-footer"> 
		<div class="retweet-popup-footer-right">
			<button class="reply-it" 
			data-tweet="<?php echo $comment_id;?>"
			data-user="<?php echo $user_id;?>"
		 type="submit"><i class="fas fa-pencil-alt" aria-hidden="true"></i>Reply</button>
		</div>
	</div>

</div>

<?php }?>
