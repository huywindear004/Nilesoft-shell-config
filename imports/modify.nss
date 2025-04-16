// modify items
// Remove items by identifiers
modify(mode=mode.multiple
	where=this.id(id.restore_previous_versions,id.cast_to_device)
	vis=vis.remove)

modify(type="recyclebin" where=window.is_desktop and this.id==id.empty_recycle_bin pos=1 sep)

modify(find="unpin*" pos="bottom" menu="Pin/Unpin")
modify(find="pin*" pos="top" menu="Pin/Unpin")

modify(where=this.id==id.copy_as_path menu="file manage")
modify(type="dir.back|drive.back" where=this.id==id.customize_this_folder pos=1 sep="top" menu="file manage")

modify(where=str.equals(this.name, ["open in terminal", "open linux shell here"]) || this.id==id.open_powershell_window_here
	pos="bottom" menu="Terminal")

modify(mode=mode.multiple
	where=this.id(
		id.send_to,
		id.share,
		id.create_shortcut,
		id.set_as_desktop_background,
		id.rotate_left,
		id.rotate_right,
		id.map_network_drive,
		id.disconnect_network_drive,
		id.format,
		id.eject,
		id.give_access_to,
		id.include_in_library,
		id.print
	)
	pos=1 menu=title.more_options)


// ======================== CUSTOM MENU ========================

menu(mode="none" type='back' expanded=true menu="New")
{
	$dt = sys.datetime("ymdHMSs")
	item(title='New .txt File' cmd=io.file.create('@(dt).txt', '') pos="top" image=icon.txt_file)
}

menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" separator="after" title=title.copy_path image=icon.copy_path)
{
	item(where=sel.count>1 title='Copy (@sel.count) items selected' cmd=command.copy(sel(false, "\n")))
	item(mode="single" title=@sel.path tip=sel.path cmd=command.copy(sel.path))
	//item(mode="single" type='file' separator="before" find='.lnk' title='open file location')
	separator
	item(mode="single" where=@sel.parent.len>3 title=sel.parent cmd=@command.copy(sel.parent))
	separator
	item(mode="single" type='file|dir|back.dir' title=sel.file.name cmd=command.copy(sel.file.name))
	item(mode="single" type='file' where=sel.file.len != sel.file.title.len title=@sel.file.title cmd=command.copy(sel.file.title))
	item(mode="single" type='file' where=sel.file.ext.len>0 title=sel.file.ext cmd=command.copy(sel.file.ext))
}

menu(separator="after" image=\uE290 title=title.select)
{
	item(title="All" image=icon.select_all cmd=command.select_all)
	item(title="Invert" image=icon.invert_selection cmd=command.invert_selection)
	item(title="None" image=icon.select_none cmd=command.select_none)
}

// ======================== END CUSTOM MENU ========================


// ======================== CUSTOM MODIFY ========================

modify(find="git gui" menu="Develop")
modify(find="git bash" menu="Terminal")

modify(where=this.id==id.copy image=icon.copy)
modify(where=this.id==id.cut image=icon.cut)
modify(where=this.id==id.paste image=icon.paste)
modify(where=this.id==id.open image=icon.open)
modify(where=this.id==id.open_file_location image=icon.open_file_location)
modify(where=this.id==id.delete image=icon.delete)
modify(where=this.id==id.rename image=icon.rename)
modify(where=this.id==id.properties image=icon.properties)
modify(where=this.id==id.open_with image=icon.open_with)
modify(where=this.id==id.sort_by image=icon.sort_by)
modify(where=this.id==id.view image=icon.view)
modify(where=this.id==id.new image=icon.new)
modify(where=this.id==id.refresh image=icon.refresh)
modify(where=this.id==id.paste_shortcut image=icon.paste_shortcut)

modify(find="IntelliJ IDEA|Visual Studio|code" menu="Develop" pos="top")

modify(find="File manage/New File" menu="New")

modify(find="Compress*|Add to*|Extract*|Winrar" menu="WinRar")

// ======================== END CUSTOM MODIFY ========================