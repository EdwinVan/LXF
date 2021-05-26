import Vue from 'vue'
import VueRouter from 'vue-router'
import Student from '../views/Student'
import Teacher from '../views/Teacher'
import Course from '../views/Course'
import Home from '../views/Home'
import Login from '../views/Login'
import Index from '../views/public/Index'
import Main from '../views/public/Main'
import Book from '../views/Book'
import Announcement from '../views/Announcement'
import Introduction from "../views/public/Introduction";
import Target from "../views/public/target";
import Team from "../views/public/team";
import Textbook from "../views/public/textbook";
import News from "../views/public/news";


Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Main',
    component: Main,
    hidden: true,
  },
  {
    path: '/home',
    name: 'Home',
    component: Home,
    hidden: true,
  },
  {
    path: '/index',
    name: 'Index',
    component: Index,
  },
  {
    path: '/introduction',
    name: 'Introduction',
    component: Introduction,
  },
  {
    path: '/target',
    name: 'Target',
    component: Target,
  },
  {
    path: '/team',
    name: 'Team',
    component: Team,
  },
  {
    path: '/textbook',
    name: 'Textbook',
    component: Textbook,
  },
  {
    path: '/News',
    name: 'News',
    component: News,
  },


  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  {
    path: '/home',
    name: '导航一',
    component: Home,
    children:[
      {
        path: '/student',
        name: '管理学生',
        component: Student
      },
      {
        path: '/teacher',
        name: '管理教师',
        component: Teacher
      },
      {
        path: '/course',
        name: '管理课程',
        component: Course
      },
      {
        path: '/book',
        name: '管理书籍',
        component: Book
      },
      {
        path: '/announcement',
        name: '管理公告',
        component: Announcement
      }
    ]
  },


]

const router = new VueRouter({
  routes
})

export default router
