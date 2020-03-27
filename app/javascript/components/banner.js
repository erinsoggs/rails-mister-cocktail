import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Welcome to Cocktails by Faker"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };
