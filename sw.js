importScripts('https://www.gstatic.com/firebasejs/9.6.1/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.6.1/firebase-messaging-compat.js');

firebase.initializeApp({
    apiKey: "AIzaSyAEl8t2m_HZ1oNOC49lmpiiM4-XhGzWRfE",
    projectId: "herovee",
    messagingSenderId: "700112828047", // আপনার সেন্ডার আইডি
    appId: "1:700112828047:web:988f0598b5341a29bba2fa"
});

const messaging = firebase.messaging();

// ব্যাকগ্রাউন্ড নোটিফিকেশন হ্যান্ডলার
messaging.onBackgroundMessage((payload) => {
    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
        icon: 'https://cdn-icons-png.flaticon.com/512/561/561127.png',
        vibrate: [200, 100, 200], // ফোন ভাইব্রেট করবে
        tag: 'call-notification',
        renotify: true,
        data: { url: payload.data.url }
    };

    return self.registration.showNotification(notificationTitle, notificationOptions);
});
