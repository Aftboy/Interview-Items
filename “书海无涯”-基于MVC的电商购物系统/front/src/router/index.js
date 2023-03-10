import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

let routes = [
    {
        path: '/',
        redirect: '/login',
    },
    {
        path: '/front',
        name: 'Front',
        component: () => import("../layout/front"),
        children: [
            {
                path: 'home',
                name: 'FrontHome',
                component: () => import("../views/front/home")
            },
            {
                path: 'search',
                name: 'Search',
                component: () => import("../views/front/search")
            },
            {
                path: 'goods',
                name: 'Goods',
                component: () => import("../views/front/goods")
            },
            {
                path: 'cart',
                name: 'Cart',
                component: () => import("../views/front/cart")
            },
            {
                path: 'preOrder',
                name: 'PreOrder',
                component: () => import("../views/front/preOrder")
            },
            {
                path: 'order',
                name: 'FrontOrder',
                component: () => import("../views/front/order")
            },
            {
                path: 'collect',
                name: 'Collect',
                component: () => import("../views/front/collect")
            },
            {
                path: 'person',
                name: 'Person',
                component: () => import("../views/front/person")
            },
            {
                path: 'address',
                name: 'Address',
                component: () => import("../views/front/address")
            },
        ]
    },
    {
        path: '/login',
        name: 'Login',
        component: () => import("../views/login")
    },
    {
        path: '/register',
        name: 'Register',
        component: () => import("../views/register")
    },
]


const createRouter = () => new VueRouter({
    mode: 'history',
    routes: routes
})

const router = createRouter()

let user = sessionStorage.getItem("user") ? JSON.parse(sessionStorage.getItem("user")) : {}
resetRouter(user.permission)

//?????????????????????????????????????????????????????????????????????????????????????????????
export function resetRouter(permissions) {
    if (permissions) {
        const newRouter = createRouter()
        router.matcher = newRouter.matcher // ???????????????matcer??????????????????????????????matcher???????????????replaceRouter???
        if (!router.getRoutes().find(v => v.name === 'Manage')) {
            router.addRoute(getPermissions(permissions))
        }
    }

}

function getPermissions(permissions) {
    let manage = {
        path: '/manage', name: 'Manage', component: () => import("../layout/manage"),
        children: [
            {path: 'person', name: '????????????', component: () => import("../views/manage/person")}
        ]
    }
    // ??????????????????
    if (permissions) {
        permissions.forEach(item => {
            manage.children.push({
                path: "/manage" + item.path,
                name: item.name,
                component: () => import("../views/manage" + item.path)
            });
        })
    }
    return manage
}


// vueRouter.beforeEach((to, from, next) => {
//     // ?????????????????????????????????????????????
//     if (to.path.includes('manage')) {
//         // ??????????????????
//         if (!user.id) {
//             // ?????????????????????
//             next({
//                 path: '/login'
//             })
//         } else {
//             // ??????????????????
//             next()
//         }
//     } else {
//         // ???????????????????????????
//         next()
//     }
// })

export default router
