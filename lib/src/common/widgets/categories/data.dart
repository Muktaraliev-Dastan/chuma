///фреймворк
import 'package:flutter/material.dart';

///модели
import 'package:chum2/src/common/models/category.dart';

List<Category> categories = [
  ///кафе
  const Category(
    label: 'Cà Phê',
    pathToImage: 'assets/from_server/categories/ca_phe.svg',
    enabled: true,
    type: CategoryType.cafe,
  ),
  const Category(
    label: 'Đac trưng của chum',
    pathToImage: 'assets/from_server/categories/dac_trung_cua.svg',
    enabled: false,
    type: CategoryType.cafe,
  ),
  const Category(
    label: 'Trà trái cậy',
    pathToImage: 'assets/from_server/categories/tra_trai_cay.svg',
    enabled: false,
    type: CategoryType.cafe,
  ),
  const Category(
    label: 'Sinh tố',
    pathToImage: 'assets/from_server/categories/Sinh To.svg',
    enabled: false,
    type: CategoryType.cafe,
  ),
  const Category(
    label: 'Sữa chua',
    pathToImage: 'assets/from_server/categories/Sua Chua.svg',
    enabled: false,
    type: CategoryType.cafe,
  ),
  const Category(
    label: 'Dồ uống nóng',
    pathToImage: 'assets/from_server/categories/do_uong_nong.svg',
    enabled: false,
    type: CategoryType.cafe,
  ),
  const Category(
    label: 'Trá mùa đông',
    pathToImage: 'assets/from_server/categories/tra_mua_dong.svg',
    enabled: false,
    type: CategoryType.cafe,
  ),


  ///рестораны
  const Category(
    label: 'Bún / Phở',
    pathToImage: 'assets/from_server/categories/Bun_pho.svg',
    enabled: false,
    type: CategoryType.restaurant,
  ),
  const Category(
    label: 'Cơm rang đảo giòn',
    pathToImage: 'assets/from_server/categories/com.svg',
    enabled: false,
    type: CategoryType.restaurant,
  ),
  const Category(
    label: 'Sét cơm 1 người',
    pathToImage: 'assets/from_server/categories/set.svg',
    enabled: false,
    type: CategoryType.restaurant,
  ),
  const Category(
    label: 'Lẩu',
    pathToImage: 'assets/from_server/categories/lau.svg',
    enabled: false,
    type: CategoryType.restaurant,
  ),
  const Category(
    label: 'Xôi',
    pathToImage: 'assets/from_server/categories/xoi.svg',
    enabled: false,
    type: CategoryType.restaurant,
  ),
];
