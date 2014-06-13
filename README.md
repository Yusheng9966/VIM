# windows 的 vim

### vim使用小技巧

* 配置文件在什么位置？

VIM帮助中对配置文件位置的说明

    Unix		$HOME/.vimrc or $HOME/.vim/vimrc
    OS/2		$HOME/.vimrc, $HOME/vimfiles/vimrc
            or $VIM/.vimrc (or _vimrc)
    MS-Windows	$HOME/_vimrc, $HOME/vimfiles/vimrc
            or $VIM/_vimrc
    Amiga		s:.vimrc, home:.vimrc, home:vimfiles:vimrc
            or $VIM/.vimrc

在windows中没有必要每个用户有各自的配置文件。
所以配置文件目录选择在`$VIM/_vimrc`。也就是将_vimrc将放到vim目录下就行了。

* 打开文件出现乱码，如何修改编码？

文件出现了乱码一般是编码格式不对造成的。VIM中常用编码有
`ucs-bom,utf8,gbk,cp936`。
注意如果打开文件的编码是utf8，使用`set encode=utf8`设置是不对的。因为这是将
VIM的整个环境都改成了utf8，这在linux下没有问题， 但在windows下就会在界面上看到乱码。
这是由于windows的系统内码不是utf8造成的。
一般使用VIM是不需要修改`encode` 选项值的。需要修改的是文件本身的编码格式。

这个选项是`set fileencoding=utf8` 
并且文件编码都是和当前打开的文件相关的，所以一般使用`setlocal fileencoding=utf8`

还有一个问题，fileencodeing的值，必须是fileencodeings里面的一种。如果设置的编码在fileencodeings里面找不到同样也不会起作用。

其实只要设置了fileencodeings，VIM是会自动判断编码格式的。

最终解决方案出来了。仅需要将`set fileencodeings=ucs-bom,utf8,gbk,cp936`加入到
配置文件中就可以了。

### 更新日志

[`update_log.md`](update_log.md)
