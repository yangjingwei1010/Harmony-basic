import { http } from '@kit.NetworkKit'
import { JSON } from '@kit.ArkTS'
import { Category } from '../models/Index'

export const getData = async () => {
  const req = http.createHttp()
  const res = await req.request('https://zhousg.atomgit.net/harmonyos-next/takeaway.json')
  return JSON.parse(res.result as string) as Category[]
}