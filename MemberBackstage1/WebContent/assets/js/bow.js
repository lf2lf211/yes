$(document).ready(function(){
//-------------menubtn--------------------------
//-------------General--------------------------		
	$('#General').click(function(){
		$('.menu_General').fadeIn();
		$('.menu_General').trigger('click');

	});
    $('.GenClick').click(function(){
    	$('#General').trigger('click')
    });

//-------------accountList--------------------------	

	$('#accountList').click(function(){
		$('.menu_accountList').fadeIn();
		$('.menu_accountList').trigger('click');

	});


//-------------dayBet--------------------------	
	$('#dayBet').click(function(){
			$('.menu_dayBet').fadeIn();
			$('.menu_dayBet').trigger('click');

		});
	

//-------------welcome--------------------------	
	$('#welcome').click(function(){
			$('.menu_welcome').fadeIn();
			$('.menu_welcome').trigger('click');

		});
	




	//-------------recharge--------------------------	
	$('#recharge').click(function(){
			$('.menu_recharge').fadeIn();
			$('.menu_recharge').trigger('click');

		});
	$('.rechargeClick').click(function(){
			$('#recharge').trigger('click');
		});
	
	$('#recharge_con').click(function(){
		$('.menu_recharge_con').fadeIn();
		$('.menu_recharge_con').trigger('click');

	});
	

	//-------------cash--------------------------	
	$('#cash').click(function(){
			$('.menu_cash').fadeIn();
			$('.menu_cash').trigger('click');

		});
	$('.cashClick').click(function(){
			$('#cash').trigger('click');
		});
	

	//-------------thirdPay--------------------------	
	$('#thirdPay').click(function(){
			$('.menu_thirdPay').fadeIn();
			$('.menu_thirdPay').trigger('click');

		});
	


		// });
	//-------------chargeRecord--------------------------	
	$('#chargeRecord').click(function(){
			$('.menu_chargeRecord').fadeIn();
			$('.menu_chargeRecord').trigger('click');

		});
	//-------------agentLV--------------------------	
	$('#agentLV').click(function(){
			$('.menu_agentLV').fadeIn();
			$('.menu_agentLV').trigger('click');
          
		});
	//-------------memList--------------------------	
	$('#memList').click(function(){
		$('.menu_memList').fadeIn();
		$('.menu_memList').trigger('click');

	});
	
	//-------------changeAgent--------------------------	
	$('#changeAgent').click(function(){
			$('.menu_changeAgent').fadeIn();
			$('.menu_changeAgent').trigger('click');

		});




		//-------------businessNO--------------------------	
	$('#businessNO').click(function(){
			$('.menu_businessNO').fadeIn();
			$('.menu_businessNO').trigger('click');
          
		});
	//-------------cashAsk--------------------------	
	$('#cashAsk').click(function(){
			$('.menu_cashAsk').fadeIn();
			$('.menu_cashAsk').trigger('click');

		});
	//-------------cashRecord--------------------------	
	$('#cashRecord').click(function(){
			$('.menu_cashRecord').fadeIn();
			$('.menu_cashRecord').trigger('click');

		});
		//-------------lobbySet--------------------------	
	$('#lobbySet').click(function(){
			$('.menu_lobbySet').fadeIn();
			$('.menu_lobbySet').trigger('click');
          
		});
	//-------------lobbySort--------------------------	
	$('#lobbySort').click(function(){
			$('.menu_lobbySort').fadeIn();
			$('.menu_lobbySort').trigger('click');

		});
	//-------------gameRule--------------------------	
	$('#gameRule').click(function(){
			$('.menu_gameRule').fadeIn();
			$('.menu_gameRule').trigger('click');

		});




		//-------------RevenueReport-营收报表-------------------------	
	$('#RevenueReport').click(function(){
			$('.menu_RevenueReport').fadeIn();
			$('.menu_RevenueReport').trigger('click');

		});
		//-------------memStatistics--会员统计------------------------	
	$('#memStatistics').click(function(){
			$('.menu_memStatistics').fadeIn();
			$('.menu_memStatistics').trigger('click');
          
		});
	//-------------BetList-注单列表-------------------------	
	$('#BetList').click(function(){
			$('.menu_BetList').fadeIn();
			$('.menu_BetList').trigger('click');

		});
	//-------------prizeResult-开奖结果-------------------------	
	$('#prizeResult').click(function(){
			$('.menu_prizeResult').fadeIn();
			$('.menu_prizeResult').trigger('click');

		});




	//-------------memOnline-在线会员-------------------------	
	$('#memOnline').click(function(){
			$('.menu_memOnline').fadeIn();
			$('.menu_memOnline').trigger('click');

		});
	//-------------dailyRecord-日志-------------------------	
	$('#dailyRecord').click(function(){
			$('.menu_dailyRecord').fadeIn();
			$('.menu_dailyRecord').trigger('click');

		});



		//-------------rightSet-权限设定-------------------------	
	$('#rightSet').click(function(){
			$('.menu_rightSet').fadeIn();
			$('.menu_rightSet').trigger('click');

		});
		//-------------changePSD--密码修改------------------------	
	$('#changePSD').click(function(){
			$('.menu_changePSD').fadeIn();
			$('.menu_changePSD').trigger('click');
          
		});
	//-------------LogInRecord-登陆日志-------------------------	
	$('#LogInRecord').click(function(){
			$('.menu_LogInRecord').fadeIn();
			$('.menu_LogInRecord').trigger('click');

		});
	//-------------BetLimSet-下注限额设置-------------------------	
	$('#BetLimSet').click(function(){
			$('.menu_BetLimSet').fadeIn();
			$('.menu_BetLimSet').trigger('click');

		});

	//-------------ReceiptSet-收款设置-------------------------	
	$('#ReceiptSet').click(function(){
			$('.menu_ReceiptSet').fadeIn();
			$('.menu_ReceiptSet').trigger('click');

		});



		//-------------addAdmin-新增会员管理-------------------------	
	$('#addAdmin').click(function(){
			$('.menu_addAdmin').fadeIn();
			$('.menu_addAdmin').trigger('click');

		});



	//-------------userRight-用户权限-------------------------	
	$('#userRight').click(function(){
			$('.menu_userRight').fadeIn();
			$('.menu_userRight').trigger('click');

		});



		$('.menu_del').click(function(){

				var index = $(this).parent().index();
				console.log(index);
				if ($('.nav-tabs li').eq(index-1).css('display')=='block') {
					$('.nav-tabs li').eq(index-1).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-2).css('display')=='block'){
					$('.nav-tabs li').eq(index-2).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-3).css('display')=='block'){
					$('.nav-tabs li').eq(index-3).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-4).css('display')=='block'){
					$('.nav-tabs li').eq(index-4).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-5).css('display')=='block'){
					$('.nav-tabs li').eq(index-5).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-6).css('display')=='block'){
					$('.nav-tabs li').eq(index-6).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-7).css('display')=='block'){
					$('.nav-tabs li').eq(index-7).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-8).css('display')=='block'){
					$('.nav-tabs li').eq(index-8).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-9).css('display')=='block'){
					$('.nav-tabs li').eq(index-9).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-10).css('display')=='block'){
					$('.nav-tabs li').eq(index-10).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-11).css('display')=='block'){
					$('.nav-tabs li').eq(index-11).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-12).css('display')=='block'){
					$('.nav-tabs li').eq(index-12).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-13).css('display')=='block'){
					$('.nav-tabs li').eq(index-13).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-14).css('display')=='block'){
					$('.nav-tabs li').eq(index-14).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-15).css('display')=='block'){
					$('.nav-tabs li').eq(index-15).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-16).css('display')=='block'){
					$('.nav-tabs li').eq(index-16).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-17).css('display')=='block'){
					$('.nav-tabs li').eq(index-17).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-18).css('display')=='block'){
					$('.nav-tabs li').eq(index-18).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-19).css('display')=='block'){
					$('.nav-tabs li').eq(index-19).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-20).css('display')=='block'){
					$('.nav-tabs li').eq(index-20).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-21).css('display')=='block'){
					$('.nav-tabs li').eq(index-21).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-22).css('display')=='block'){
					$('.nav-tabs li').eq(index-22).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-23).css('display')=='block'){
					$('.nav-tabs li').eq(index-23).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-24).css('display')=='block'){
					$('.nav-tabs li').eq(index-24).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-25).css('display')=='block'){
					$('.nav-tabs li').eq(index-25).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-26).css('display')=='block'){
					$('.nav-tabs li').eq(index-26).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-27).css('display')=='block'){
					$('.nav-tabs li').eq(index-27).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-28).css('display')=='block'){
					$('.nav-tabs li').eq(index-28).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-29).css('display')=='block'){
					$('.nav-tabs li').eq(index-29).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-30).css('display')=='block'){
					$('.nav-tabs li').eq(index-30).children('a').trigger('click');
				}else if($('.nav-tabs li').eq(index-31).css('display')=='block'){
					$('.nav-tabs li').eq(index-31).children('a').trigger('click');
				}
				
				
				
				console.log($('.nav-tabs li').eq(index-1));
				$(this).parent().hide();
			});	
//-------------menubtnEND--------------------------		
        $(function() {
          $( ".datepicker" ).datepicker({
            dateFormat: 'yy-mm-dd'

          });
        });



        	/*↓按按鈕後改顏色*/
		$('.btn-primary').click(function(){
			$(this).addClass('active').siblings('input');
			$(this).siblings('.btn-primary').removeClass('active');
		});
	/*↑按按鈕後改顏色*/

// Javascript to enable link to tab
var url = document.location.toString();
if (url.match('#')) {
    $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
    
} 

// Change hash for page-reload
$('.nav-tabs a').on('shown.bs.tab', function (e) {

   	if (url.match('#menu01')) {
			$('.menu_General').fadeIn();
		}
	
   	if (url.match('#menu02')) {
			$('.menu_accountList').fadeIn();
		}
	
	if (url.match('#menu03')) {
		$('.menu_dayBet').fadeIn();
	}


	if (url.match('#menu4')) {
			$('.menu_welcome').fadeIn();
		}

	if (url.match('#menu5')) {
		$('.menu_recharge').fadeIn();
	}
	if (url.match('#menu39')) {
		$('.menu_recharge_con').fadeIn();
	}
   	if (url.match('#menu6')) {
			$('.menu_cash').fadeIn();
		}
	
	if (url.match('#menu7')) {
		$('.menu_thirdPay').fadeIn();
	}


	if (url.match('#menu8')) {
			$('.menu_chargeRecord').fadeIn();
		}

	if (url.match('#menu9')) {
		$('.menu_agentLV').fadeIn();
	}
	
   	if (url.match('#menu10')) {
			$('.menu_memList').fadeIn();
		}
	
	if (url.match('#menu11')) {
		$('.menu_changeAgent').fadeIn();
	}

	
	if (url.match('#menu15')) {
		$('.menu_lobbySet').fadeIn();
	}
	
   	if (url.match('#menu18')) {
			$('.menu_RevenueReport').fadeIn();
		}
	
	if (url.match('#menu19')) {
		$('.menu_memStatistics').fadeIn();
	}


	if (url.match('#menu20')) {
			$('.menu_BetList').fadeIn();
		}

	if (url.match('#menu21')) {
		$('.menu_prizeResult').fadeIn();
	}

   	if (url.match('#menu22')) {
			$('.menu_memOnline').fadeIn();
		}
	
	if (url.match('#menu23')) {
		$('.menu_dailyRecord').fadeIn();
	}


	if (url.match('#menu24')) {
			$('.menu_rightSet').fadeIn();
		}

	
   	if (url.match('#menu26')) {
			$('.menu_LogInRecord').fadeIn();
		}
	
	if (url.match('#menu27')) {
		$('.menu_BetLimSet').fadeIn();
	}


	if (url.match('#menu28')) {
			$('.menu_ReceiptSet').fadeIn();
		}

	if (url.match('#menu29')) {
		$('.menu_addAdmin').fadeIn();
	}
	
	if (url.match('#menu30')) {
		$('.userRight').fadeIn();
	}
	

    window.location.hash = e.target.hash;
})


$('.change_Btn').click(function(){
	$('.changeMember').slideToggle();

	var $memberNo = $(this).parent().parent().find('.memberNo').text();
	var $account = $(this).parent().parent().find('.account').text();
	var $password = $(this).parent().parent().find('.password').text();
	var $name = $(this).parent().parent().find('.name').text();
	var $level = $(this).parent().parent().find('.level').text();

	console.log( $memberNo);
	console.log($account);
	console.log($password);
	console.log($name);
	console.log($level);
	$('.changeMember .memberNo').val($memberNo);
	$('.changeMember .account').val($account);
	$('.changeMember .password').val($password);
	$('.changeMember .name').val($name);

    if ($level =="总代理") {

    	$(".level option[value='总代理']").attr("selected","selected");
    };

    if ($level =="大代理") {

	$(".level option[value='大代理']").attr("selected","selected");
    };

    if ($level =="代理") {

    	$(".level option[value='代理']").attr("selected","selected");
    };
    
    if ($level =="管理员") {

	$(".level option[value='管理员']").attr("selected","selected");
    };

	
});


});
		