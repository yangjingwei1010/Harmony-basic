
// ResourceStr = Resource | string
const self: Record<string, ResourceStr> = {
  'avtar': $r('app.media.b'),
  'nickName': '码农',
  'gender': '男',
  'age': '18'
}

export const localUserInfo = new LocalStorage(self)