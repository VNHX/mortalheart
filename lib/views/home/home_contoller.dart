

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/models/home/home_page_info.dart';
import 'dart:math' as math;
class HomeController extends GetxController {
  /// 刷新
  final EasyRefreshController freshController =  EasyRefreshController(controlFinishRefresh:true);
  /// 滚动条
  final ScrollController scrollController = ScrollController();
  /// 页码
  final PageController pageController = PageController();
  /// 滚动条值
  late double pageScrollY = 0.0 ;
  /// 搜索栏广告条
  final List searchList =['跑步鞋','鸡胸肉','苹果13 手机壳'].obs;
  /// 加载
  final isLoading = RxBool(false);
  /// 二层楼打开
  final pageFloor = RxBool(false);
  final isTabClick = RxBool(false);
   /// homebj
  final homebj = RxString('https://m15.360buyimg.com/mobilecms/jfs/t1/218369/27/14203/132191/6226a702E5a0b9236/a11294e884bc7635.jpg!cr_1053x420_4_0!q70.jpg');
  /// tabs
   final tabs = RxList([]);
   /// 当前选中Tabs
  final currentTab = '1'.obs;
  /// 判断 tabs 是否选中
  final isSelect = false.obs;
  // 轮播图
   final bannerList = RxList([]);
  // 菜单
   final menuList = RxList([]);
   /// 菜单 index
   final menuSliderIndex = 0.obs;
   /// 广告条
  final adUrl = RxString('');


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intPage();
    print('初始化');
  }
  @override
  void dispose() {
    super.dispose();
    freshController.dispose();
  }
  intPage() async {
    var data =  {
      "searchList":['跑步鞋','鸡胸肉','苹果13 手机壳'],
      "bannerList": [
        // {
        //   "imgUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/218369/27/14203/132191/6226a702E5a0b9236/a11294e884bc7635.jpg!cr_1053x420_4_0!q70.jpg",
        //   "type": "1"
        // },
        // {
        //   "imgUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/158791/25/27003/106834/620c4bc2Efb15fc57/7c89841a597ce41b.jpg!cr_1053x420_4_0!q70.jpg",
        //   "type": "2"
        // },
        // {
        //   "imgUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/121592/2/24818/138081/622ccc8fEdf840f95/cd229433d699c70c.jpg!cr_1053x420_4_0!q70.jpg.dpg.webp",
        //   "type": "4"
        // },
        // {
        //   "imgUrl": "https://imgcps.jd.com/ling-cubic/danpin/lab/amZzL3QxLzE2Mjc4Mi8zNi85MTM4LzQ0NjQ1MS82MDQwN2Q4MUVkMDlmMWM5OC9jZWVmOWU0OWVkNzlkNjZkLnBuZw/6Zi_6L-q6L6-5pav6LeR5q2l6Z6L/5qmh6IO25aSW5bqV/60586f6fa1b18f3314204f2d/cr_1125x449_0_166/s/q70.jpg",
        //   "type": "5"
        // }
      ],
      "subsidyList": [
        // {
        //   "imgUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/218369/27/14203/132191/6226a702E5a0b9236/a11294e884bc7635.jpg!cr_1053x420_4_0!q70.jpg",
        //   "type": "1"
        // },
        // {
        //   "imgUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/158791/25/27003/106834/620c4bc2Efb15fc57/7c89841a597ce41b.jpg!cr_1053x420_4_0!q70.jpg",
        //   "type": "2"
        // },
        // {
        //   "imgUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/121592/2/24818/138081/622ccc8fEdf840f95/cd229433d699c70c.jpg!cr_1053x420_4_0!q70.jpg.dpg.webp",
        //   "type": "4"
        // },
        // {
        //   "imgUrl": "https://imgcps.jd.com/ling-cubic/danpin/lab/amZzL3QxLzE2Mjc4Mi8zNi85MTM4LzQ0NjQ1MS82MDQwN2Q4MUVkMDlmMWM5OC9jZWVmOWU0OWVkNzlkNjZkLnBuZw/6Zi_6L-q6L6-5pav6LeR5q2l6Z6L/5qmh6IO25aSW5bqV/60586f6fa1b18f3314204f2d/cr_1125x449_0_166/s/q70.jpg",
        //   "type": "5"
        // }
      ],
      "adUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/105817/5/25878/84922/622f2e3eE548c75b1/a564811c5763d4e8.png!q70.jpg",
      "nineMenuList": [
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/102632/18/20350/13255/61e131feE788947ef/c391b8590cdf427e.png!q70.jpg",
          "menuName": "超市",
          "menuCode": "m01",
          "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/146216/7/22157/182757/622f37e8Ec2445bac/658b95154cb12771.gif",
          "menuName": "电器",
          "menuCode": "m02",
          "h5url": "https://prodev.m.jd.com/mall/active/8tHNdJLcqwqhkLNA8hqwNRaNu5f/index.html"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/104637/39/25735/190791/622f3682E168960d2/2dbfbaf4147134c1.gif",
          "menuName": "国际",
          "menuCode": "m11",
          "h5url": "https://gmart.jd.com"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/172178/32/9487/10851/609d18e0Ed273eec1/a1e099f1601c8cc2.png!q70.jpg",
          "menuName": "服饰",
          "menuCode": "m03",
          "h5url": "https://h5.m.jd.com/pb/014076750/48qPXkwvatBBCAhdeTXG5WQam4yq/index.html"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/193038/4/3881/13295/60a4b6a7E4124dc9e/fdd2934e97eab3ac.png!q70.jpg",
          "menuName": "免费水果",
          "menuCode": "m04"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/107776/17/21311/9709/61e12b6eEa79cbefa/bd0bb902e126fafb.png!q70.jpg",
          "menuName": "会员",
          "menuCode": "m10",
          "h5url": "https://shop.m.jd.com/shop/home?shopId=1000343263&utm_source=iosapp&utm_medium=appshare&utm_campaign=t_335139774&utm_term=Wxfriends&ad_od=share&utm_user=plusmember&gx=RnAomTM2bjTfycsT-YNzCTmOd9y9Fa0&gxd=RnAokmcIOjONmssR_YNyCIMKIb4Xa5DwoYs6Qbze_4h9aUHPDecui7HTjqAWskU"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/189533/37/5319/12852/60b05d59Eb3b3fd29/4c478e3347507e51.png!q70.jpg",
          "menuName": "生鲜",
          "menuCode": "m13",
          "h5url": "https://pro.m.jd.com/mall/active/4P9a2T9osR9JvtzHVaYTPvsecRtg/index.html"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/188405/35/3707/11116/60a26055Ef91c306d/1ba7aa3b9328e35e.png!q70.jpg",
          "menuName": "拍拍二手",
          "menuCode": "m17",
          "h5url": "https://prodev.m.jd.com/mall/active/LHGZv1DrGkva1jNpUkKFuNFN6oo/index.html"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/181856/30/3968/10274/609e3d99E07c63af4/cb0d5b21c461b07f.png!q70.jpg",
          "menuName": "喜喜",
          "menuCode": "m05"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/91538/20/21166/8105/61e128b9E06558f00/2c9273cdee9b2e3d.png!q70.jpg",
          "menuName": "生活缴费",
          "menuCode": "m06"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/185536/13/17333/14522/6108a9f0E62572408/8222cc8a66134776.png!q70.jpg",
          "menuName": "领豆",
          "menuCode": "m07"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/175369/35/26446/17302/61e12945E09ef2a2f/87b391aff2da560a.png!q70.jpg",
          "menuName": "领券",
          "menuCode": "m08"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/127505/17/20504/10647/61e112b0E4f382c96/7a042862fc7c479e.png!q70.jpg",
          "menuName": "领金贴",
          "menuCode": "m09"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/129902/19/16911/11005/60b05dd8Edad29a3f/ca6b3ea0f67e1826.png!q70.jpg",
          "menuName": "沃尔玛",
          "menuCode": "m14"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/192361/9/5316/11815/60b05d25Eec7f6b5e/5555dcc59d99428d.png!q70.jpg",
          "menuName": "旅行",
          "menuCode": "m15"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/109159/13/17721/9654/60b05d73Eefa154db/3a4a46ef2755c622.png!q70.jpg",
          "menuName": "看病购药",
          "menuCode": "m16"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/177688/12/4847/7352/60a39a9bEe0a7e4f8/1a8efe458d1c3ee2.png!q70.jpg",
          "menuName": "种豆得豆",
          "menuCode": "m18"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/184718/8/4051/11977/609e5222Ea2816259/d29fec6d4d8558f1.png!q70.jpg",
          "menuName": "萌宠",
          "menuCode": "m19"
        },
        {
          "menuIcon": "https://m15.360buyimg.com/mobilecms/jfs/t1/126310/38/18675/7912/60b05e32E736cb5fe/2bb8508e955b88ee.png!q70.jpg",
          "menuName": "更多频道",
          "menuCode": "m20"
        }
      ],
      "tabList": [
        {
          "name": "精选",
          "code": "1"
        },
        {
          "name": "新品",
          "code": "2"
        },
        {
          "name": "直播",
          "code": "3"
        },
        {
          "name": "实惠",
          "code": "4"
        },
        {
          "name": "进口",
          "code": "5"
        },
        {
          "name": "精选",
          "code": "6"
        },
        {
          "name": "新品",
          "code": "7"
        },
        {
          "name": "直播",
          "code": "8"
        },
        {
          "name": "实惠",
          "code": "9"
        },
        {
          "name": "进口",
          "code": "10"
        }
      ]
    };
    final res = HomePageInfo.fromJson(data ?? {}) ;
    isLoading.value = true;
      isLoading.value = false;
      tabs.value = res.tabList ?? [];
      bannerList.value = res.bannerList ?? [];
      adUrl.value = res.adUrl ?? '';
      menuList.value = res.nineMenuList ?? [];
  }


  Future<void> easyRefreshSuccess(EasyRefreshController freshController) async {
    freshController.finishRefresh(IndicatorResult.success);
    intPage();
  }



  Future<void> easyRefreshFail(EasyRefreshController freshController) async {
    freshController.finishRefresh(IndicatorResult.fail);
  }
  // 滚动距离
  Future<void> onScroll(ScrollNotification notification) async {
    double distance = notification.metrics.pixels;
    if(pageFloor.value){
      freshController.closeHeaderSecondary();
    }
    if (notification.depth == 0) {
      // pageScrollY =distance.obs as double;
    }
  }
  /// 首页tabs分类
  Future<void> onTabChange(code, List tabs) async {
    isTabClick.value = true;
    currentTab.value = code;
    int tabIndex = tabs.indexWhere((element) => element.code == code);
    pageController.animateToPage(
        tabIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear
    ).then((value) => isTabClick.value = false);

  }
 /// 菜单 滑动
  Future<void> setMenuSliderIndex(int index) async {
    print('这是Menu$index');
    menuSliderIndex.value = index;
    print('这是滑动的值：${ menuSliderIndex.value}');
  }
}