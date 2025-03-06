'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9e315a090d7e041cac6c2f999217e510",
"assets/AssetManifest.bin.json": "5ac29caa76c184f90e942fdc4b3f6ae8",
"assets/AssetManifest.json": "a791ed5943a739076258a7fcaaf12346",
"assets/assets/docs/Guia_Pr%25C3%25A1tico_para_o_Desenvolvimento_de_Roteiros_Imag%25C3%25A9ticos_Sinalizados.pdf": "d75b65c791d1c51806bb14735f6b0f12",
"assets/assets/fonts/montserrat/Montserrat-Black.ttf": "cce7ff8c1d7999f907b6760fbe75d99d",
"assets/assets/fonts/montserrat/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/assets/fonts/montserrat/Montserrat-ExtraBold.ttf": "9e07cac927a9b4d955e2138bf6136d6a",
"assets/assets/fonts/montserrat/Montserrat-Medium.ttf": "bdb7ba651b7bdcda6ce527b3b6705334",
"assets/assets/fonts/montserrat/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/assets/fonts/montserrat/Montserrat-SemiBold.ttf": "cc10461cb5e0a6f2621c7179f4d6de17",
"assets/assets/images/matheus.jpeg": "88ca2e4b7bae935c9c21f577fec3cd4e",
"assets/assets/images/pamela.jpg": "7e7f95e9260246ca829bf5601f7ab0cb",
"assets/assets/images/vanessa.jpg": "815e0daa5a8646850cde80089029975e",
"assets/assets/logo/logo.png": "8807cf4d3b793282489ba5746dd03d9f",
"assets/assets/prototype/video_1.mp4": "664d4d33605f6911ee6bfe96a7274830",
"assets/assets/prototype/video_2.mp4": "d79e6dfd9ee1769b9c43922272f1c6c9",
"assets/assets/prototype/video_3.mp4": "1164abe38cea9eced31e9d44b0e0c5e8",
"assets/assets/prototype/video_4.mp4": "a4faf01b7ed9945b9dd754b5705fb1e7",
"assets/assets/roadmaps/industrial_revolution/images/ind_rev_1.jpg": "e67411c3ecd44d69b24876e5084154ea",
"assets/assets/roadmaps/industrial_revolution/images/ind_rev_2.jpg": "56a43cb38f186d3f9bf25bb1781f8768",
"assets/assets/roadmaps/industrial_revolution/images/ind_rev_3.jpg": "03748ed90d24389ed841ebe6b9d1706d",
"assets/assets/roadmaps/industrial_revolution/images/ind_rev_4.jpg": "cf2dc12219ce28404de65eae95980c46",
"assets/assets/roadmaps/industrial_revolution/images/ind_rev_5.jpg": "80978c13913f617c1ab737ceb251f05e",
"assets/assets/roadmaps/industrial_revolution/images/ind_rev_6.jpg": "1289a95039c5fe1ec35feabef5836721",
"assets/assets/roadmaps/industrial_revolution/images/ind_rev_7.jpg": "b653d9a511b0bae3812c5d7937b6ce36",
"assets/assets/roadmaps/industrial_revolution/videos/ind_rev_1.mp4": "c56ea4d09747bffe18aacec40353f204",
"assets/assets/roadmaps/industrial_revolution/videos/ind_rev_2.mp4": "c65012724ed4d05e7d0b455fb4f8b89d",
"assets/assets/roadmaps/industrial_revolution/videos/ind_rev_3.mp4": "7005852bf3e132a8534e9cdec0efe979",
"assets/assets/roadmaps/industrial_revolution/videos/ind_rev_4.mp4": "5cc8d23289a66ede14341496124caa88",
"assets/assets/roadmaps/industrial_revolution/videos/ind_rev_5.mp4": "c42d5025aa96b1b80ffbcb93598e6e20",
"assets/assets/roadmaps/industrial_revolution/videos/ind_rev_6.mp4": "536774377f9651deb178bb354c739129",
"assets/assets/roadmaps/industrial_revolution/videos/ind_rev_7.mp4": "b57b0a488fb587b9e0ade7c0462ed8f5",
"assets/FontManifest.json": "26f693809336a5f08e46bde16e9165c7",
"assets/fonts/MaterialIcons-Regular.otf": "6b5e3ef87edf4a52e7724f721c2abfe2",
"assets/NOTICES": "f8089b8ef858088e960325ed676e2193",
"assets/packages/youtube_player_iframe/assets/player.html": "663ba81294a9f52b1afe96815bb6ecf9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "866fd922c46d85178888e17bdcdd546f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2b67f21ee209be6274cc49fe69707430",
"/": "2b67f21ee209be6274cc49fe69707430",
"main.dart.js": "7385e584c7ad2969d5370d879229d969",
"manifest.json": "d87890e4f26a8db5813bfde8d65c20ed",
"version.json": "c4ec7a67ac26fc78d69de4d102f1ef18"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
