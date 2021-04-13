import request from '@/util/request'
import Qs from 'qs'

export function login(data) {
  return request({
    url: '/api/app/login/login',
    method: 'post',
    data
  })
}

export function getNonce(address) {
  return request({
    url: '/api/app/login/requestNonce',
    method: 'get',
    params: { address }
  })
}

export function getInfo(token) {
  return request({
    url: '/api/admin/admin/info',
    method: 'get',
    params: { token }
  })
}

export function updateInfo(data) {
  return request({
    url: '/api/admin/admin/updateProfile',
    method: 'post',
    data
  })
}

export function logout() {
  return request({
    url: '/vue-element-admin/user/logout',
    method: 'post'
  })
}

export function sendMsg(data) {
  return request({
    url: '/api/admin/admin/sendVerifyCode',
    method: 'post',
    data: Qs.stringify({
      ...data
    })
  })
}
