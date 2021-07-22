class ProductInfo {
  final int position;
  final String name;
  final String PageHead;
  final String PageSub;
  final String iconImage;
  final String description;
  final List<String> images;
  ProductInfo(this.position,
      {this.images,
      this.name,
      this.iconImage,
      this.description,
      this.PageHead,
      this.PageSub});
}

List<ProductInfo> product = [
  ProductInfo(
    1,
    name: "Apple",
    iconImage: "images/a.png",
    PageHead: "i Planet",
    PageSub: "iOS/Mac",
    description:
        "1)The iPhone 12 Pro Max display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 16.95 centimetres (6.68 inches) diagonally (actual viewable area is less).\n\n2) Apple MacBook Air 2020 is a macOS laptop with a 13.30-inch display that has a resolution of 2560x1600 pixels. It is powered by a Core i3 processor and it comes with 8GB of RAM. The Apple MacBook Air 2020 packs 256GB of SSD storage. Graphics are powered by Integrated Graphics Processor.\n\n3)The iPad Pro is Apple's high-end tablet computer. The latest iPad Pro models feature a powerful M1 chip, a Thunderbolt port, an improved front-facing camera, a Liquid Retina XDR mini-LED display option on the larger model, and up to 16GB of RAM and 2TB of storage.",
    images: [
      "images/iphone.png",
      "images/mac.jpg",
      "images/ipad.jpg",
    ],
  ),
  ProductInfo(2,
      name: "Android",
      PageHead: "A-Planet",
      PageSub: "Candies",
      iconImage: "images/and.png",
      description:
          "1) The phone has 12 GB of RAM and runs Android 11 based OS. The phone is powered by a Qualcomm Snapdragon 888 octa-core processor. OnePlus has added a 5-layer Gaming Grade cooling system that according to the company keeps the phone cool, even when you are gaming for longer periods of time.\n\n2) Samsung Galaxy S20 is powered by a 2GHz octa-core Samsung Exynos 990 processor that features 2 cores clocked at 2.73GHz, 2 cores clocked at 2.5GHz and 4 cores clocked at 2GHz. It comes with 8GB of RAM. ... The Samsung Galaxy S20 measures 151.70 x 69.10 x 7.90mm (height x width x thickness) and weighs 163.00 grams.\n\n3) The Redmi K20 Pro is available in two variants, 6GB RAM with 128GB storage and 8GB RAM with 256GB storage, priced at Rs. 27,999 and Rs. 30,999 respectively. It sports a triple camera setup at the back consisting of a 48-megapixel primary sensor, 13-megapixel ultra-wide angle sensor and an 8-megapixel tele-photo sensor.",
      images: [
        "images/oneplus.png",
        "images/samsung.jpg",
        "images/mi20.jpg",
      ]),
];
