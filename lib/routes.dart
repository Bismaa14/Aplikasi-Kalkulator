import 'package:flutter/material.dart';
import 'package:flutter_application_3/main_splash.dart';
import 'package:flutter_application_3/main_page.dart';
import 'package:flutter_application_3/page/dashboard_page.dart';
import 'package:flutter_application_3/page/kalkulator_page.dart';
import 'package:flutter_application_3/page/login_page.dart';
import 'package:flutter_application_3/page/massa_page.dart';
import 'package:flutter_application_3/page/bmi_page.dart';
import 'package:flutter_application_3/page/suhu_page.dart';
import 'package:flutter_application_3/page/panjang_page.dart';
import 'package:flutter_application_3/page/biodata_page.dart';
import 'package:flutter_application_3/ui/list_ui_page.dart';
import 'package:flutter_application_3/page/pengaturan_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/main':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/kalkulator':
        return MaterialPageRoute(builder: (_) => kalkulatorPage());
      case '/kalkulator_massa':
        return MaterialPageRoute(builder: (_) => MassaPage());
      case '/bmi_kalkulator':
        return MaterialPageRoute(builder: (_) => BmiPage());
      case '/konversi_suhu':
        return MaterialPageRoute(builder: (_) => SuhuPage());
      case '/biodata':
        return MaterialPageRoute(builder: (_) => BiodataPage());
      case '/kalkulator_panjang':
        return MaterialPageRoute(builder: (_) => PanjangPage()); 
      case '/todo_list':
        return MaterialPageRoute(builder: (_) => ToDoListPage());
      case '/dashboard_page':
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case '/pengaturan_page':
        return MaterialPageRoute(builder: (_) => PengaturanPage());
      // Tambahkan rute lain sesuai kebutuhan Anda.
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}

