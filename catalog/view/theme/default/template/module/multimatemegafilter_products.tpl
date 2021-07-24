<?php if(empty($products)) { ?>              
             <p>Good things Always makes us Wait.</p>
             <?php } else { ?>
<?php foreach ($products as $product) { ?>
                
             <!--Calculate Discount-->
            <?php
              if($product['price'] && $product['special']){
                $price=substr($product['price'],3);
                $price = str_replace( ',', '', $price );
                $special=substr($product['special'],3);
                $special = str_replace( ',', '', $special );
                
                if($price>$special){

                  $ans= ((($price-$special)/$price)*100);                    
                  $ans=intval($ans);
                if($ans!=0){ ?>
              
            <?php }}}?>                     

<div class="col-md-3 col-lg-3 col-xs-6 col-sm-4 col-xs-6">
<?php  //echo $product['stock_status']. '- ' .$product['quantity'];
$rdx=0;
//pre($product);
if($product['price'] && $product['special']){
$rdx = 0;
               $special =  str_replace(',','',str_replace('Rs.','', $product['special']));

               $price =  str_replace(',','',str_replace('Rs.','', $product['price']));
                
                if($price>$special || $price != $special){

                  $rdx= floor((($price-$special)/$price)*100);                    
                  //$rdx=floor($ans);
                  }

if(!empty($product['discount']))
               {
                 //$discount =  str_replace(',','',str_replace('Rs.','', $product['discount']));

                  $discount = $product['discount'];

                 if($price>$discount || $price != $discount){
                  $rdx= ceil((($price-$discount)/$price)*100);
                //  echo 'in'.$rdx;
                  }

               }
               else
               {
                $discount = false;
               }
                } ?>  
<div class="item_listing <?php if($product['quantity'] == 0 || $product['stock_status_id'] == 5) { ?> out-opactiry <?php } ?>">
<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="" id="<?php echo $product['href'];?>" /><figcaption><?php echo substr($product['name'],0,20).'...'; ?></figcaption>




<!---<figcaption><?php if(isset($special) && ($special< $price)){  ?><del><?php if($_SESSION["currency"]=="INR"){ ?><i class="fa fa-inr"></i><?php }?> <?php echo $price; ?></del><?php } ?>&nbsp;<strong><?php if($_SESSION["currency"]=="INR"){ ?><i class="fa fa-inr"></i><?php }?> <?php if(isset($special) && ($special< $price)){  ?><?php echo $special;  }else { echo $price; }?></strong><?php if($rdx>0){ ?><span><?php echo $rdx."% Off"; ?> </span><?php }?></figcaption> ---->


<?php if($_SESSION["currency"]=="INR"){ ?>

                <figcaption><?php if(isset($special) && ($special< $price)){  ?><del><i class="fa fa-inr"></i><?php echo $price; ?></del><?php } ?>
                  &nbsp;
                <?php if(!empty($discount) && ($discount< $special)){  ?>&nbsp;<del><i class="fa fa-inr"></i><?php echo $special; ?></del><?php } ?> </figcaption>

                  <figcaption style="padding:5px 0 0 0;">
                   <i class="fa fa-inr"></i><?php if(isset($special) && ($special< $price) && empty($discount)){  ?>
                  <?php echo $special;  } 
                  else if(!empty($discount) && ($discount< $special))
                  {
                    echo $discount;
                  }
                  else { echo $price; }?> <?php if($rdx>0){ ?><span class="theme-color"><?php echo $rdx."%"; ?></span><?php }?></figcaption>

                <?php } else { ?>
                        <figcaption><?php echo $special;?></figcaption>
                <?php } ?>


</a>

</div>
<?php if($product['quantity'] == 0 || $product['stock_status_id'] == 5) { ?>
           <div class="out_of-stock-blg">          
<a href="<?php echo $product['href']; ?>" ;>Out Of Stock</a>         
           </div>
           <?php } ?>
</div>
<?php }} ?>