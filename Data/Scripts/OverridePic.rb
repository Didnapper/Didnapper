$override_pic = {}
def getOverridePic (filename)
	if $override_pic.has_key?(filename)
		return $override_pic[filename]
	else
		return RPG::Cache.picture(filename)
	end
end
#swap one picture with another
def swpPic (pic,replacement)
	$override_pic[pic] = RPG::Cache.picture(replacement)
end
#restore to default
def restPic (pic)
	$override_pic[pic] = RPG::Cache.picture(pic)
end

#may have to do the same thing with battler, etc
