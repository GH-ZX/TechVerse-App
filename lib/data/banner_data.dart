import 'package:flutter/material.dart';

class BannerItem {
  final String image;
  final String title;
  final String subtitleKey;
  final Color color;

  BannerItem({
    required this.image,
    required this.title,
    required this.subtitleKey,
    required this.color,
  });
}

final List<BannerItem> bannerData = [
  BannerItem(
    image: 'https://www.wavesad.com/wp-content/uploads/2024/08/Banner-Laptop-7.jpg',
    title: 'Surface Laptop',
    subtitleKey: 'surface_subtitle',
    color: Colors.blue.shade700,
  ),
  BannerItem(
    image: 'https://i.ytimg.com/vi/hNmad8MzBl8/maxresdefault.jpg',
    title: 'Lenovo Legion Pro 7i',
    subtitleKey: 'legion_subtitle',
    color: Colors.red.shade800,
  ),
  BannerItem(
    image: 'https://5.imimg.com/data5/SELLER/Default/2024/11/465860979/VE/SZ/VR/3116103/apple-macbook-pro-mneh3jn-a-new-model.jpg',
    title: 'MacBook Pro',
    subtitleKey: 'macbook_subtitle',
    color: Colors.grey.shade900,
  ),
  BannerItem(
    image: 'https://i.ytimg.com/vi/6vrIIfy7Mfg/maxresdefault.jpg',
    title: 'MSI Stealth Gaming',
    subtitleKey: 'msi_subtitle',
    color: Colors.purple.shade800,
  ),
  BannerItem(
    image: 'https://www.amd.com/content/dam/amd/en/images/products/laptops/2201103-amd-advantage-laptop-rog-zephyrus-g14-video-thumbnail.png',
    title: 'ASUS ROG Zephyrus G14',
    subtitleKey: 'rog_subtitle',
    color: const Color.fromARGB(255, 105, 18, 199),
  ),
  BannerItem(
    image: 'https://i.pcmag.com/imagery/reviews/01FIvTZt1sIxZydOira9RYm-5..v1680798175.jpg',
    title: 'MSI Katana GF66',
    subtitleKey: 'katana_subtitle',
    color: Colors.red.shade800,
  ),
];
