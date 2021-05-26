//将menu中的component转化为对象
import axios from 'axios'

export const findAllMenus=(router,store)=>{
    if(store.state.routes.length>0) {
        return;
    }
    axios.get("/menu").then( (resp)=>{
        if(resp.data) {
            let tfRoutes = transformRoutes(resp.data)
            router.addRoutes(tfRoutes)
            store.commit("findAllRoutes",tfRoutes)
        }
    })
}


export const transformRoutes=(routes)=>{
    let tfRoutes = [];
    routes.forEach(router=>{
        let {
            pattern,
            component,
            name,
            children
        } =router
        if (children && children instanceof Array) {
            children = transformRoutes(children)
        }
        let tfRouter = {
            path:pattern,
            name: name,
            children: children,
            component(resolve) {
                require(["../views/" + component + '.vue'],resolve)
            }
        }
        tfRoutes.push(tfRouter)
    })
    return tfRoutes;
}