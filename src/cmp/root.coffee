import { E, useMount } from '@ppzp/utils.rc'
import { useRender, make_book } from './state.coffee'
import './root.styl'

import Header from './header/index.coffee'
import Nav from './nav/index.coffee'
import Book from './book/index.coffee'
import Open from './open/index.coffee'

export default ->
  render = useRender()
  useMount ->
    # root 挂载好后，检查是否为“通过双击 .epub 文件”来打开应用
    window.launchQueue?.setConsumer (params) ->
      make_book await params.files[0].getFile()
  
  return E plass: 'mess_reader_root',
    E Nav
    E plass: 'boxx',
      E Header
      if render
        E Book
      else
        E Open
