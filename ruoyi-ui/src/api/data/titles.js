import request from '@/utils/request'

// 查询会计科目列表
export function listTitles(query) {
  return request({
    url: '/data/titles/list',
    method: 'get',
    params: query
  })
}

// 查询会计科目详细
export function getTitles(id) {
  return request({
    url: '/data/titles/' + id,
    method: 'get'
  })
}

// 新增会计科目
export function addTitles(data) {
  return request({
    url: '/data/titles',
    method: 'post',
    data: data
  })
}

// 修改会计科目
export function updateTitles(data) {
  return request({
    url: '/data/titles',
    method: 'put',
    data: data
  })
}

// 删除会计科目
export function delTitles(id) {
  return request({
    url: '/data/titles/' + id,
    method: 'delete'
  })
}
