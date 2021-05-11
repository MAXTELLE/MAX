--[[

]]

function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
	-- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

local getUser = function(user_id,cb)
tdcli_function({ID = "GetUser",user_id_ = user_id},cb,nil)
end

Bot_Api = 'https://api.telegram.org/bot'.. Token
function send_inline(chat_id,text,keyboard,markdown)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
else
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=HTML'
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return https.request(url)
end








function lock_photos(msg)
if not msg.Director then 
return "💥*┃* هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n🚶"
end
redis:set(max.."getidstatus"..msg.chat_id_, "Simple")
return  "💥*┃* أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* تم تعطيل الايدي بالصوره  \n✓" 
end 
function unlock_photos(msg)
if not msg.Director then
return "💥*┃* هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n🚶"
end
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
return  "💥*┃* أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* تم تفعيل الايدي بالصوره \n✓" 
end
function cmds_on(msg)
if not msg.Creator then return "💥*┃* هذا الامر يخص {المنشئ,المطور} فقط  \n🚶"
end
redis:set(max..'lock:kara:'..msg.chat_id_,'on')
return "💥*┃* أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* تم تعطيل الرفع في المجموعه \n✓"
end
function cmds_off(msg)
if not msg.Creator then return "💥*┃* هذا الامر يخص {المنشئ,المطور} فقط  \n🚶"
end
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return "💥*┃* أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* تم تفعيل الرفع في المجموعه \n✓"
end

function lockjoin(msg)
if not msg.Admin then return "💥*┃* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶"
end
redis:set(max..'lock:join:'..msg.chat_id_,true)
return "*💥*┃* أهلا عزيزي *"..msg.TheRankCmd.."*\n💥*┃* تم قفل الدخول بالرابط \n✓*" 

end
function unlockjoin(msg)
if not msg.Admin then return "💥*┃* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶"
end
redis:del(max..'lock:join:'..msg.chat_id_)
return "*💥*┃* أهلا عزيزي *"..msg.TheRankCmd.."*\n💥*┃* تم فتح الدخول بالرابط \n✓*" 
end


local function imax(msg,MsgText)

Channel = redis:get(max..'setch') or katrenno
--JoinChannel
function is_JoinChannel(msg)
if redis:get(max..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not GeneralBanned((msg.adduser or msg.sender_user_id_)) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not msg.SudoUser then
function name(arg,data)
bd = '💥┃اسمك  ('..(data.first_name_ or '')..')\n💥┃معرفك (@'..(data.username_ or '')..')\n\n💥┃آشـترگ بآلقنآ‌‏هہ آولآ \n💥┃ثم آرجع آستخدم الامر.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'آشـترگ بآلقنآ‌‏هہ 💥',url='https://telegram.me/'..Channel}}}   
send_inline(msg.chat_id_,bd,keyboard,'html')
end
getUser(msg.sender_user_id_,name)
else
return true
end
else
return true
end
end
if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end






if MsgText[1] == "تفعيل الايدي بالصوره" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "تعطيل الايدي بالصوره" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "تعطيل الرفع" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "تفعيل الرفع" and not MsgText[2] then
return cmds_off(msg) 
end

if MsgText[1] == "قفل الدخول بالرابط" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "فتح الدخول بالرابط" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "💥*┃*هذا الامر يخص {المطور} فقط  \n💥" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(max..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┃تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️┃تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️┃في مجموعه  » »  '..redis:get(max..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┃عزيزي المطور ✋🏿\n👨🏻‍🔧┃شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "💥*┃*هذا الامر يخص {المطور} فقط  \n💥" end
if MsgText[2] == '1' then
redis:setex(max..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┃تم تفعيل الاشتراك   👍🏿\n💥┃ الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️┃تم تفعيل الاشتراك  👍🏿\n💥┃ الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(max..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┃تم تفعيل الاشتراك   👍🏿\n💥┃ الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️┃تم تفعيل الاشتراك   👍🏿\n💥┃ الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(max..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┃تم تفعيل الاشتراك   👍🏿\n💥┃ الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️┃تم تفعيل الاشتراك   👍🏿\n💥┃ الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local check_time = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳┃`باقي من الاشتراك ` » » * \n 💥┃ '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳┃`باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳┃`باقي من الاشتراك ` » » * \n 💥┃ '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳┃`باقي من الاشتراك ` » » * \n 💥┃ '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳┃`باقي من الاشتراك ` » » * \n 💥┃ '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳┃`باقي من الاشتراك ` » » * \n 💥┃ '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end




if MsgText[1] == "المجموعه" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(max..'group:name'..msg.chat_id_) or '')
redis:set(max..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"💥┃ ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*💥┃* عدد الاعـضـاء 〃 ❪ *"..data.member_count_.."* ❫"
.."\n*💥┃* عدد المحظـوريـن 〃 ❪ *"..data.kicked_count_.."* ❫"
.."\n*💥┃* عدد الادمـنـيـه 〃 ❪ *"..data.administrator_count_.."* ❫"
.."\n*💥┃* ايدي المجموعه 〃 ❪"..msg.chat_id_.."❫"
.."\n\n💥┃الاسم 〃 ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return GetListAdmin(msg) 
end

if MsgText[1] == "تاك للكل" then
if not msg.Admin then return "💥*┃* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 100
},function(ta,hasn)
local t = "\n💥| قائمة الاعضاء \n\n"
x = 0
local list = hasn.members_
for k, v in pairs(list) do
users = redis:get(max..'user_names:'..v.user_id_) or v.user_id_
x = x + 1
t = t..""..x.." - {["..users.."](tg://user?id="..v.user_id_..")} \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if (MsgText[1] == "تاك للسرسريه" and is_JoinChannel(msg)) then 
if not msg.Admin then return "💥*┃* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "تاك" then 
if not msg.Admin then return "💥*┃* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "المنشى الاساسي" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return MONSEBOT(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return ownerlist(msg) 
end

if MsgText[1] == "المنشئ الاساسي" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return Hussainlist(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return whitelist(msg) 
end


if MsgText[1] == "صلاحياته" then 
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "صلاحياته" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'💥┃المعرف غير صحيح \n👨🏻‍✈️')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'💥┃هاذا معرف قناة \n👨🏻‍✈️')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "فحص البوت" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. max..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
return sendMsg(msg.chat_id_,msg.id_,'\n📌┃اهلا عزيزي البوت هنا ادمن بالقروب \n💢┃وصلاحياته هي ⇓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n📝┃تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n📨┃حذف الرسائل ↞ ❪ '..delete..' ❫\n🚷┃حظر المستخدمين ↞ ❪ '..restrict..' ❫\n♻┃دعوة مستخدمين ↞ ❪ '..invite..' ❫\n🔘┃تثبيت الرسائل ↞ ❪ '..pin..' ❫\n💥┃اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n💠┃ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"💥*┃*أهلا عزيزي "..msg.TheRankCmd.." \n📌*┃* تم تثبيت الرساله \n✓")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* عذرا لا يمكنني التثبيت .\n🎟*┃* لست مشرف او لا املك صلاحيه التثبيت \n 💥')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"💥*┃*أهلا عزيزي "..msg.TheRankCmd.."  \n💬*┃* تم الغاء تثبيت الرساله \n✓")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* عذرا لا يمكنني الغاء التثبيت .\n🎟*┃* لست مشرف او لا املك صلاحيه التثبيت \n 💥')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* عذرا عزيزي '..msg.TheRankCmd..' .\n🎟*┃* لا توجد رساله مثبته لاقوم بازالتها \n 💥')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"💥*┃* أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* الرفع معطل \n✓")
end
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"💥*┃* أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* الرفع معطل \n✓")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع منشى اساسي" or MsgText[1] == "رفع منشئ اساسي") then
if not msg.malk then return "💥*┃*هذا الامر يخص {المطور,المطور الاساسي} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setkara"}) 
return false
end 
end

if (MsgText[1] == "تنزيل منشئ الاساسي" or MsgText[1] == "تنزيل منشئ الاساسي") then
if not msg.malk then return "💥*┃*هذا الامر يخص {المطور,المطور الاساسي} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remkara"}) 
return false
end 
end


if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.malk then return "💥*┃*هذا الامر يخص {المالك و المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.Kara then return "💥*┃*هذا الامر يخص {المطور,المنشى الاساسي فقط} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"💥*┃* أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* الرفع معطل \n✓")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end



if MsgText[1] == "تنزيل الكل" then
if not msg.Admin then return "📪¦ هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
msg = arg.msg
msg.UserID = UserID
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
msg = arg.msg
UserID = msg.UserID
if UserID == our_id then return sendMsg(msg.chat_id_,msg.id_,"📛*¦* لآ يمكنك تنفيذ الامر مع البوت\n❕") end
if UserID == 819385837 or UserID == 60809019 then return sendMsg(msg.chat_id_,msg.id_,"📛*¦* لآ يمكنك تنفيذ الامر ضد مطور السورس \n❕") end

if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(max..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 4
elseif redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
rinkuser = 5
elseif redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
rinkuser = 6
elseif redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then 
rinkuser = 7
else
rinkuser = 8
end
local DonisDown = "\n📛¦ تم تنزيله من الرتب الاتيه : \n\n "
if redis:sismember(max..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من المطور ✓️\n"
end 
if redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من المنشئ الاساسي ✓️\n"
end 
if redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من المنشئ ✓️\n"
end 
if redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من المدير ✓️\n"
end 
if redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من الادمن ✓️\n"
end 
if redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."❌¦ تم تنزيله من العضو مميز ✓️\n"
end
function senddwon() sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا المستخدم رتبته اعلى منك لا يمكن تنزيله \n❕") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا لا يمكن تنزيل رتبه مثل رتبتك : "..msg.TheRankCmd.." \n❕") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"📮¦ المستخدم  ⋙「 "..NameUser.." 」   \nانه بالتأكيد عضو \n✓️")  end
huk = false
if msg.SudoBase then 
redis:srem(max..':SUDO_BOT:',UserID)
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Kara then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Creator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Director then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Admin then 
if rinkuser == 6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
else
huk = true
end

if not huk then sendMsg(msg.chat_id_,msg.id_,"📮¦ المستخدم  ⋙「 "..NameUser.." 」 \n"..DonisDown.."\n✓️") end

end,{msg=msg})
end,{msg=msg})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يمكنك تنفيذ الامر مع البوت\n❕") end

msg = arg.msg
if UserID == 819385837 or UserID == 60809019 then return sendMsg(msg.chat_id_,msg.id_,"📛*¦* لآ يمكنك تنفيذ الامر ضد مطور السورس \n❕") end
NameUser = Hyper_Link_Name(data)

if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(max..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 4
elseif redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
rinkuser = 5
elseif redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
rinkuser = 6
elseif redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then 
rinkuser = 7
else
rinkuser = 8
end
local DonisDown = "\n📛¦ تم تنزيله من الرتب الاتيه : \n\n "
if redis:sismember(max..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من المطور ✓️\n"
end 
if redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من المنشئ الاساسي ✓️\n"
end 
if redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من المنشئ ✓️\n"
end 
if redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من المدير ✓️\n"
end 
if redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."❌¦ تم تنزيله من الادمن ✓️\n"
end 
if redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."❌¦ تم تنزيله من العضو مميز ✓️\n"
end

function senddwon() sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا المستخدم رتبته اعلى منك لا يمكن تنزيله \n❕") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا لا يمكن تنزيل رتبه مثل رتبتك : "..msg.TheRankCmd.." \n❕") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"📮¦ المستخدم  ⋙「 "..NameUser.." 」   \nانه بالتأكيد عضو \n✓️")  end
huk = false
if msg.SudoBase then 
redis:srem(max..':SUDO_BOT:',UserID)
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Kara then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Creator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Director then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Admin then 
if rinkuser == 6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
else
huk = true
end

if not huk then sendMsg(msg.chat_id_,msg.id_,"📮¦ المستخدم  ⋙「 "..NameUser.." 」 \n"..DonisDown.."\n✓️") end

end,{msg=msg})
end 

if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwnAll"}) 
end

return false
end



--=====================================================================================


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاك" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "قفل التعديل" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاك" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "التعديل" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if not redis:get(max..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(max..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(max..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"💥*┃*تم انشاء رابط جديد \n💥┃["..LinkGp.."]\n💥┃لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"💥┃لا يمكنني انشاء رابط للمجموعه .\n🎟┃لانني لست مشرف في المجموعه \n 💥")
end
else
return sendMsg(msg.chat_id_,msg.id_,"💥┃لقد قمت بانشاء الرابط سابقا .\n🎟┃ارسل { الرابط } لرؤيه الرابط  \n 💥")
end
return false
end 

if MsgText[1] == "ضع رابط" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
redis:setex(max..'linkGroup'..msg.sender_user_id_,300,true)
return '🔗┃عزيزي قم برسال الرابط الجديد ...🍂'
end

if MsgText[1] == "الرابط" then
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "💥*┃* اوه 🙀 لا يوجد رابط ☹️\n💥*┃*لانشاء رابط ارسل { `انشاء رابط` }\n💥" 
end
local GroupName = redis:get(max..'group:name'..msg.chat_id_)
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
return "💥┃رابـط الـمـجـمـوعه 💯\n🌿┃"..Flter_Markdown(GroupName).." :\n\n["..GroupLink.."]\n"
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
if not GroupLink then return "💥*┃* اوه 🙀 لا يوجد هنا رابط\n💥┃*رجائا اكتب [ضع رابط]*🔃" end
local Text = "💥┃رابـط الـمـجـمـوعه 💯\n🌿┃"..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "💥*┃*عذرا عزيزي \n🌿┃لم استطيع ارسالك الرابط لانك قمت بحظر البوت\n!"
elseif res == 400 then
return "💥*┃*عذرا عزيزي \n🌿┃ لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا \n!"
end
if res == 200 then 
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."  \n🌿┃تم ارسال الرابط خاص لك 🔃"
end
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
redis:setex(max..'rulse:witting'..msg.sender_user_id_,300,true)
return '💥┃حسننا عزيزي  ✋🏿\n🗯┃الان ارسل القوانين  للمجموعه 🍃'
end

if MsgText[1] == "القوانين" then
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "💥*┃*مرحبأ عزيري القوانين كلاتي 👇🏻\n💥┃ممنوع نشر الروابط \n💥┃ممنوع التكلم او نشر صور اباحيه \n⚔┃ممنوع  اعاده توجيه\n💥┃ممنوع التكلم بلطائفه \n♥️┃الرجاء احترام المدراء والادمنيه\n"
else 
return "*💥┃القوانين :*\n"..redis:get(max..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "💥*┃* حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(max..'flood'..msg.chat_id_,MsgText[2]) 
return "💥*┃* تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if 500 < tonumber(MsgText[2]) then return "💥*┃* حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⛑┃* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  \n✓")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⛑┃* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  \n✓")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end

local Admins = redis:scard(max..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "💥*┃* اوه ☢ هنالك خطأ 💥\n💥┃عذرا لا يوجد ادمنيه ليتم مسحهم ✓" 
end
redis:del(max..'admins:'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃تم مسح {"..Admins.."} من الادمنيه في البوت \n✓"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
local Mn3Word = redis:scard(max..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "💥*┃* عذرا لا توجد كلمات ممنوعه ليتم حذفها ✓" 
end
redis:del(max..':Filter_Word:'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃تم مسح {*"..Mn3Word.."*} كلمات من المنع ✓"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "💥┃عذرا لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(max..'rulse:msg'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃تم حذف القوانين بنجاح ✓"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if not redis:get(max..'welcome:msg'..msg.chat_id_) then 
return "💥*┃* اوه ☢ هنالك خطأ 💥\n💥┃عذرا لا يوجد ترحيب ليتم مسحه ✓" 
end
redis:del(max..'welcome:msg'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃تم حذف الترحيب بنجاح \n✓"
end


if MsgText[2] == "المنشى الاساسي" then
if not msg.SudoUser then return "💥*┃*هذا الامر يخص {المطور} فقط  \n💥" end
local NumMnsha = redis:scard(max..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "💥┃عذرا لا يوجد منشى اساسي \n!" 
end
redis:del(max..':Hussain:'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃ تم مسح {* "..NumMnsha.." *} المنشى الاساسي \n✓"
end


if MsgText[2] == "المنشئيين" then
if not msg.SudoUser then return "💥*┃*هذا الامر يخص {المطور} فقط  \n💥" end
local NumMnsha = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "💥┃عذرا لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃ تم مسح {* "..NumMnsha.." *} من المنشئيين\n✓"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local NumMDER = redis:scard(max..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "💥┃عذرا لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(max..'owners:'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃ تم مسح {* "..NumMDER.." *} من المدراء  \n✓"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end

local list = redis:smembers(max..'banned:'..msg.chat_id_)
if #list == 0 then return "*📌┃لا يوجد مستخدمين محظورين  *" end
message = '💥*┃* قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(max..'banned:'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃ تم مسح {* "..#list.." *} من المحظورين  \n✓"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
local MKTOMEN = redis:scard(max..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "💥*┃* لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(max..'is_silent_users:'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃ تم مسح {* "..MKTOMEN.." *} من المكتومين  \n✓"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
local MMEZEN = redis:scard(max..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*⚙️*┃لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(max..'whitelist:'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃ تم مسح {* "..MMEZEN.." *} من المميزين  \n✓"
end


if MsgText[2] == 'الرابط' then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "*⚙️*┃لا يوجد رابط مضاف اصلا " 
end
redis:del(max..'linkGroup'..msg.chat_id_)
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."   \n💥┃تم مسح رابط المجموعه \n✓"
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
redis:setex(max..'name:witting'..msg.chat_id_..msg.sender_user_id_,300,true)
return "💥┃حسننا عزيزي  ✋🏿\n🗯┃الان ارسل الاسم  للمجموعه \n💥"
end


if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n??" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'💥┃تم مسح الصوره آلمـجمـوعهہ 🌿\n✓')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'💥┃تم تغيير صوره آلمـجمـوعهہ ⠀\n✓')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'💥┃ليس لدي صلاحيه تغيير الصوره \n🤖 ┃يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(max..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '💥┃حسننا عزيزي 🍁\n💥┃الان قم بارسال الصوره\n💥' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
redis:setex(max..'about:witting'..msg.sender_user_id_,300,true) 
return "💥┃حسننا عزيزي  ✋🏿\n🗯┃الان ارسل الوصف  للمجموعه\n💥" 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"💥| لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "📌 | عـدد الـبـوتات •⊱ {* "..(Total - 1).." *} ⊰•\n\n"
if NumBot == 0 then 
TextR = TextR.."💥┃لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."💥 |  لم يتم طـرد {* "..NumBotAdmin.." *} بوت لآنهہ‌‏م مـشـرفين."
else
TextR = TextR.."💥 |  تم طـرد كــل البوتآت بنجآح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '🤖| قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

💥| لـديـک {]]..total..[[} بـوتـآت
💥| ملاحظة : الـ ★ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
sendMsg(msg.chat_id_,msg.id_,'💥 | جاري البحث عـن الـحـسـابـات المـحذوفـة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(max..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(max..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(max..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"💥┃تم طـرد {* "..NumMemDone.." *} من آلحسـآبآت آلمـحذوفهہ‏‏ 🌿")
else
sendMsg(msg.chat_id_,msg.id_,'💥┃لا يوجد حسابات محذوفه في المجموعه 🌿')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then
	if not MsgText[2] and not msg.reply_id then
	if redis:get(max..'lock_id'..msg.chat_id_) then 
	local msgs = redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
	GetUserID(msg.sender_user_id_,function(arg,data)
	if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
	local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
	if points and points ~= "0" then
	nko = points
	else
	nko = '0'
	end
	local rfih = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
	local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
	local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
	GetPhotoUser(msg.sender_user_id_,function(arg, data)
	  if redis:get(max.."KLISH:ID:bot"..msg.chat_id_) then
		Text = redis:get(max.."KLISH:ID:bot"..msg.chat_id_)
			Text = Text:gsub('#id',msg.sender_user_id_)
			Text = Text:gsub('#username',UserNameID)
			Text = Text:gsub('RTBGET',msg.TheRank)
			Text = Text:gsub('#stast',Get_Ttl(msgs))
			Text = Text:gsub('#msgs',msgs)
			Text = Text:gsub('#edit',rfih)
			Text = Text:gsub('adduser',NumGha)
			Text = Text:gsub('User_Points',nko)
	  elseif redis:get(max.."NightRang:Set:Id:Group"..msg.chat_id_) then
		Text = redis:get(max.."NightRang:Set:Id:Group"..msg.chat_id_)
			Text = Text:gsub('#id',msg.sender_user_id_)
			Text = Text:gsub('#username',UserNameID)
			Text = Text:gsub('RTBGET',msg.TheRank)
			Text = Text:gsub('#stast',Get_Ttl(msgs))
			Text = Text:gsub('#msgs',msgs)
			Text = Text:gsub('#edit',rfih)
		Text = Text:gsub('#bio',biouser)
			Text = Text:gsub('adduser',NumGha)
			Text = Text:gsub('User_Points',nko)
	  elseif redis:get("KLISH:ID") then
		Text = redis:get("KLISH:ID")
			Text = Text:gsub('IDGET',msg.sender_user_id_)
			Text = Text:gsub('USERGET',UserNameID)
			Text = Text:gsub('RTBGET',msg.TheRank)
			Text = Text:gsub('TFGET',Get_Ttl(msgs))
			Text = Text:gsub('MSGGET',msgs)
			Text = Text:gsub('edited',rfih)
			Text = Text:gsub('adduser',NumGha)
			Text = Text:gsub('User_Points',nko)
	  else
		Text = '🎫╿معرفـك ['..UserNameID..']\n🎟│ايديـك ❪ '..msg.sender_user_id_..' ❫\n📡│رتبتـك ❪ '..msg.TheRank..' ❫\n🎲│تفاعلك ❪ '..Get_Ttl(msgs)..' ❫\n💬│رسائلك ❪ '..msgs..' ❫\n🚸│سحكاتـك ❪ '..rfih..' ❫\n📞│الـجـهـات ❪ '..NumGha..' ❫\n🐞╽نقاطك ❪ '..nko..' ❫\n'
	  end
	if redis:get(max.."getidstatus"..msg.chat_id_) == "Photo" then
		if data.photos_[0] then 
			ali = {'شهل صورة😍😌','لا قيمه للقمر امام وجهك🌚🥀','خليني احبك🙈❤️','ببكن خاص 🌚😹','نكبل 🙈♥','منور اليوم 😻','فديت الحلو🌚😹','شهل عسل ،₍🍯😻⁾ ','كلي يا حلو منين الله جابك🙈❤️','يهلا بلعافيه😍','مارتاحلك😐','تحبني؟🙈',
			}
			ssssys = ali[math.random(#ali)]
			sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,'🙋🏼‍♂️╿'..ssssys..'\n'..Text,dl_cb,nil)
		else
		print(Text)
			sendMsg(msg.chat_id_,msg.id_,'📬│لا يمكنني عرض صورتك لانك قمت بحظر البوت او انك لاتملك صوره في بروفيلك ...!\n'..Text:escape_hard())
		end
	else
		sendMsg(msg.chat_id_,msg.id_,'📬│الايدي بالصوره معطل \n'..Text:escape_hard())
	end
	
	end) 
	end ,nil)
	end
	return false
	end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n✔️┃❪ الاحـصـائـيـات الـرسـائـلك ❫\n \n"
.."💬┃الـرسـائـل ❪ "..msgs.." ❫\n"
.."📞┃الـجـهـات ❪ "..NumGha.." ❫\n"
.."📸┃الـصـور ❪ "..photo.." ❫\n"
.."📽┃الـمـتـحـركـه ❪ "..animation.." ❫\n"
.."💥┃الـمـلـصـقات ❪ "..sticker.." ❫\n"
.."🎙┃الـبـصـمـات ❪ "..voice.." ❫\n"
.."🔊┃الـصـوت ❪ "..audio.." ❫\n"
.."🎞┃الـفـيـديـو ❪ "..video.." ❫\n"
.."📬┃الـتـعـديـل ❪ "..edited.." ❫\n"
.."📊┃تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "💥*┃*عذرا لا يوجد رسائل لك في البوت  💥" end
redis:del(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "💥*┃*تم مسح {* "..msgs.." *} من رسائلك ☔️\n✓"
end

if MsgText[1]== 'جهاتي' then
return '🧟‍♂*┃*  عدد جهہآتگ آلمـضـآفهہ‏‏ 〃 ❪ '..(redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n🐾'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "💥*┃*عذرا ليس لديك جهات لكي يتم مسحها" end
redis:del(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "💥*┃*تم مسح {* "..adduser.." *} من جهاتك\n✓"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..'\n\n⚁┃اسمك الثاني 〃 '..(data.last_name_ or ""),90)
local Get_info = "⚀┃اسمك الاول 〃 \n "..FlterName.." \n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'نقاطي'  then
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if points == 0 then  return "💥*┃*عذرا ليس لديك مجوهرات لكي يتم مسحها" end
redis:del(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "💥*┃*تم مسح {* "..points.." *} من مجوهراتك\n✓"
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="👨🏽‍🔧┃اهـلا بـك عزيزي في معلوماتك 🥀 \n"
.."┄─┅═ـ═┅─┄\n"
.."🗯┃الاســم ❪ "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." ❫\n"
.."💠┃المعرف ❪ "..ResolveUser(data).." ❫\n"
.."💥️┃الايـدي ❪ `"..msg.sender_user_id_.."` ❫\n"
.."💥┃رتبتــك ❪ "..msg.TheRank.." ❫\n"
.."🔰┃ـ ❪ `"..msg.chat_id_.."` ❫\n"
.."┄─┅═ـ═┅─┄\n"
.." ❪ الاحـصـائـيـات الـرسـائـل ❫\n"
.."💬┃الـرسـائـل ❪ `"..msgs.."` ❫\n"
.."📞┃الـجـهـات ❪ `"..NumGha.."` ❫\n"
.."📸┃الـصـور ❪ `"..photo.."` ❫\n"
.."📽┃الـمـتـحـركـه ❪ `"..animation.."` ❫\n"
.."💥┃الـمـلـصـقات ❪ `"..sticker.."` ❫\n"
.."🎙┃الـبـصـمـات ❪ `"..voice.."` ❫\n"
.."🔊┃الـصـوت ❪ `"..audio.."` ❫\n"
.."🎞┃الـفـيـديـو ❪ `"..video.."` ❫\n"
.."📬┃الـتـعـديـل ❪`"..edited.."` ❫\n"
.."📊┃تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "مسح معلوماتي" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="💥┃اهلن عزيزي تم حذف جميع معلوماتك "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "فتح تعديل الميديا" 		then return unlock_edit_media(msg) end 
if MsgText[1] == "قفل تعديل الميديا" 		then return lock_edit_media(msg) end 

if MsgText[1] == "فتح الفشار" 		then return unlock_mmno3(msg) end 
if MsgText[1] == "قفل الفشار" 		then return lock_mmno3(msg) end 

if MsgText[1] == "تفعيل الردود العشوائيه" 	then return unlock_replayRn(msg) end
if MsgText[1] == "تعطيل الردود العشوائيه" 	then return lock_replayRn(msg) end

if MsgText[1] == "فتح الفارسيه" 		then  return unlock_pharsi(msg) end 
if MsgText[1] == "قفل الفارسيه" 		then return lock_pharsi(msg) end 

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
redis:set(max..'welcom:witting'..msg.sender_user_id_,true) 
return "💥┃حسننا عزيزي  ✋🏿\n🗯┃ارسل كليشه الترحيب الان\n\n💥┃ملاحظه تستطيع اضافه دوال للترحيب مثلا :\n🗒┃اضهار قوانين المجموعه  » *{القوانين}*  \n📰┃ اضهار الاسم العضو » *{الاسم}*\n🏷┃اضهار المعرف العضو » *{المعرف}*\n🏷┃اضهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if redis:get(max..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(max..'welcome:msg'..msg.chat_id_))
else 
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."  \n🌿┃نورت المجموعه \n💂🏼‍♀️" 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end
if msg.text and msg.text:match('^كتم بالوقت (%d+)$') and msg.reply_id then
  if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
  local user = msg.text:match('^mute (%d+)$') 
  if tonumber(user) >= tonumber(1) then
    function Get(MR,EIKOei)
      if not EIKOei.sender_user_id_ then 
        return false
      end 
      function g(m,r)
        if EIKOei.sender_user_id_ == our_id then   
        return sendMsg(msg.chat_id_,msg.id_,"💥*┃*لا يمكنك كتم البوت\n❧") 
        elseif EIKOei.sender_user_id_ == SUDO_ID then 
        return sendMsg(msg.chat_id_,msg.id_,"💥*┃*لا يمكنك كتم المطور الاساسي\n❧") 
        elseif redis:sismember(max..':SUDO_BOT:',EIKOei.sender_user_id_) then 
        return sendMsg(msg.chat_id_,msg.id_,"💥*┃*لا يمكنك كتم المطور\n❧") 
        elseif redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,EIKOei.sender_user_id_) then 
        return sendMsg(msg.chat_id_,msg.id_,"💥*┃*لا يمكنك كتم المنشئ\n❧") 
        elseif redis:sismember(max..'owners:'..msg.chat_id_,EIKOei.sender_user_id_) then 
        return sendMsg(msg.chat_id_,msg.id_,"💥*┃*لا يمكنك كتم المدير\n❧") 
        elseif redis:sismember(max..'admins:'..msg.chat_id_,EIKOei.sender_user_id_) then 
        return sendMsg(msg.chat_id_,msg.id_,"💥*┃*لا يمكنك كتم الادمن\n❧") 
        end
        redis:setex(max..'Time:mute:'..msg.chat_id_..':'..EIKOei.sender_user_id_,user*60,true)
        SendMention(msg.chat_id_,EIKOei.sender_user_id_,msg.id_,'العضو ❪ '..r.first_name_..' ❫\n لوقت  '..user..' دقيقه تم كتمه ',8,r.first_name_)
      end
      GetUserID(EIKOei.sender_user_id_,g,nil)
    end
    GetMsgInfo(msg.chat_id_,tonumber(msg.reply_to_message_id_),Get,nil)
  else
    return sendMsg(msg.chat_id_,msg.id_,"ادخل عدد اكبر من 1") 
  end
end
if msg.text == 'الغاء الكتم بالوقت' and msg.reply_id then
  if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
  function Get(MR,EIKOei)
    if not EIKOei.sender_user_id_ then
      return false
    end
    function g(m,r)
    if redis:get(max..'Time:mute:'..msg.chat_id_..':'..EIKOei.sender_user_id_) then
      redis:del(max..'Time:mute:'..msg.chat_id_..':'..EIKOei.sender_user_id_) 
      sendMsg(msg.chat_id_,msg.id_,'العضو '..r.first_name_..' تم كتمه') 
    else
      sendMsg(msg.chat_id_,msg.id_,'العضو '..r.first_name_..' لم يكن مكتوم بل وقت') 
    end
  end
  GetUserID(EIKOei.sender_user_id_,g,nil)
  end
  GetMsgInfo(msg.chat_id_,tonumber(msg.reply_to_message_id_),Get,nil)
end
if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "💥*┃*هذا الامر يخص {المطور,المنشئ} فقط  \n💥" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
local mtwren = redis:scard(max..':SUDO_BOT:')
if mtwren == 0 then  return "⚙️*┃* عذرا لا يوجد مطورين في البوت  💥" end
redis:del(max..':SUDO_BOT:') 
return "💥*┃* تم مسح {* "..mtwren.." *} من المطورين ☔️\n✓"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
local addbannds = redis:scard(max..'gban_users')
if addbannds ==0 then 
return "*⚙️┃قائمة الحظر فارغه .*" 
end
redis:del(max..'gban_users') 
return "⚙️*┃* تـم مـسـح { *"..addbannds.." *} من قائمه العام\n✓" 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" then
if not msg.SudoBase then return "💥*┃*هذا الامر يخص {المطور الاساسي 👨‍💻} فقط  \n💥" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "تنظيف المجموعات 💥" then
local groups = redis:smembers(max..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'💯*┃* جـيـد , لا توجد مجموعات وهميه \n✓')
else
sendMsg(msg.chat_id_,msg.id_,'💥*┃* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n💥*┃* تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n📉*┃* اصبح العدد الحقيقي الان •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين 💥" or MsgText[1] == "تنظيف المشتركين 💥" then
local pv = redis:smembers(max..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(max..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'💥| جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'💥*┃* عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n💥*┃* تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n📉*┃* اصبح العدد الحقيقي الان •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(max..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'📭╿حسننا عزيزي 🍁\n🌄 ╽الان قم بارسال الصوره للترحيب \n🛠' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(max..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[💥┃اهلا انآ بوت آسـمـي ]]..redis:get(max..':NameBot:')..[[ ✓
👨🏻‍✈️┃آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
💥┃مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...

🎭┃مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
]])

return false
else
return "💥┃لا توجد صوره مضافه للترحيب في البوت \n📌┃ لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(max..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '💥┃حسننا عزيزي 🍁\n💬┃الان قم بارسال الكليشه \n💥' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(max..':addnumberusers',MsgText[2]) 
return '💱*┃* تم وضـع شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..MsgText[2]..'】* عضـو  🍁\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'💥*┃* شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..redis:get(max..':addnumberusers')..'】* عضـو  🍁\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🌋" then
	if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	return '📮*│* عدد المجموعات المفعلة » `'..redis:scard(max..'group:ids')..'`  ➼' 
	end
	
	if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين Ⓜ" then
	if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	return '🙍🏻‍♂*│*عدد المشتركين في البوت : `'..redis:scard(max..'users')..'` \n📡'
	end
	
	if MsgText[1] == 'قائمه المجموعات' then 
	if not msg.SudoBase then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	return chat_list(msg) 
	end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "💥*┃*هذا الامر يخص {المطور} فقط  \n💥" end
if redis:sismember(max..'group:ids',MsgText[2]) then
local name_gp = redis:get(max..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'💥*┃* تم تعطيل المجموعه بأمر من المطور  \n💥*┃* سوف اغادر جاوو 🚶🏻🚶🏻 ...\n✘')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '💥*┃* تم تعطيل المجموعه ومغادرتها \n🏷*┃* المجموعةة » ['..name_gp..']\n💥*┃* الايدي » ( *'..MsgText[2]..'* )\n✓'
else 
return '💥*┃* لا توجد مجموعه مفعله بهذا الايدي !\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(max..":TEXT_SUDO") or '🗃┃لا توجد كليشه المطور .\n📰┃يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n💥'
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📣" then
	if not msg.SudoUser then return"♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	if not msg.SudoBase and not redis:get(max..'lock_brod') then 
	return "📡*│* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
	end
	redis:setex(max..'fwd:'..msg.sender_user_id_,300, true) 
	return "📭│حسننا الان ارسل التوجيه للاذاعه \n🔛" 
	end
	
	if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام 📢" then		
	if not msg.SudoUser then return"♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	if not msg.SudoBase and not redis:get(max..'lock_brod') then 
	return "📡*│* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
	end
	redis:setex(max..'fwd:all'..msg.sender_user_id_,300, true) 
	return "📭│حسننا الان ارسل الكليشه للاذاعه عام \n🔛" 
	end
	
	if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص 🗣" then		
	if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	if not msg.SudoBase and not redis:get(max..'lock_brod') then 
	return "📡*│* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
	end
	redis:setex(max..'fwd:pv'..msg.sender_user_id_,300, true) 
	return "📭│حسننا الان ارسل الكليشه للاذاعه خاص \n🔛"
	end
	
	if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه 🗣" then		
	if not msg.SudoUser then return"♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	if not msg.SudoBase and not redis:get(max..'lock_brod') then 
	return "📡*│* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
	end
	redis:setex(max..'fwd:groups'..msg.sender_user_id_,300, true) 
	return "📭│حسننا الان ارسل الكليشه للاذاعه للمجموعات \n🔛" 
	end
	
	if MsgText[1] == "المطورين" or MsgText[1] == "المطورين 🔥" then
	if not msg.SudoUser then return"♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	return sudolist(msg) 
	end
	 
	if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمه العام 📜" then 
	if not msg.SudoUser then return"♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
	return GetListGeneralBanned(msg) 
	end
	
	if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
	if not msg.SudoBase then return"♦️*│*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
	return lock_twasel(msg) 
	end
	
	if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
	if not msg.SudoBase then return"♦️*│*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
	return unlock_twasel(msg) 
	end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return '💥*┃* رتبتك 〃 ❪ '..msg.TheRank..' ❫\n➖' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
	if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
	redis:del(max..'welcom:witting'..msg.sender_user_id_,
	max..'rulse:witting'..msg.sender_user_id_,
	max..'rulse:witting'..msg.sender_user_id_,
	max..'name:witting'..msg.sender_user_id_,
	max..'about:witting'..msg.sender_user_id_,
	max..'fwd:all'..msg.sender_user_id_,
	max..'fwd:pv'..msg.sender_user_id_,
	max..'fwd:groups'..msg.sender_user_id_,
	max..'namebot:witting'..msg.sender_user_id_,
	max..'addrd_all:'..msg.sender_user_id_,
	max..'delrd:'..msg.sender_user_id_,
	max..'addrd:'..msg.sender_user_id_,
	max..'delrdall:'..msg.sender_user_id_,
	max..'text_sudo:witting'..msg.sender_user_id_,
	max..'addrd:'..msg.chat_id_..msg.sender_user_id_,
	max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
	return '📬*│* تم آلغآء آلآمـر بنجآح \n🌿'
	end  


	if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
		return '👨🏾‍🔧│ اصدار سورس مـاكـس : *v'..version..'* \n📡'
		end
		

if (MsgText[1] == 'تحديث السورس' or MsgText[1] == 'تحديث السورس 💥') then
if not msg.SudoBase then return "💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
local GetVerison = https.request('https://github.com/MAXTELLE/max.github.io/GetVersion.txt') or 0
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'💥*┃* يوجد تحديث جديد الان \n💥*┃* جاري تنزيل وتثبيت التحديث  ...')
redis:set(max..":VERSION",GetVerison)
return false
else
return "💥┃الاصدار الحالي : *v"..version.."* \n👨🏾‍🔧*┃* لديـك احدث اصدار \n📦"
end
return false
end

if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'⏳*┃* جاري رفع النسخه انتظر قليلا ... \n⌛️')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"💥*┃* عذرا النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n💥")
end
else 
sendMsg(msg.chat_id_,msg.id_,'💥*┃* عذرا اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس ماكس يرجى جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n💥')
end  
else
sendMsg(msg.chat_id_,msg.id_,'💥*┃* عذرا الملف ليس بصيغه Json !?\n💥')
end 
else
sendMsg(msg.chat_id_,msg.id_,'💥*┃* عذرا هذا ليس ملف النسحه الاحتياطيه للمجموعات\n💥')
end 
end,nil)
else 
return "📦*┃* ارسل ملف النسخه الاحتياطيه اولا\n💥*┃* ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
return "💯 البوت شـغــال 💥" 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايديي🆔") and msg.type == "pv" then return  "\n👨🏻‍💻 | اهلن عزيزي المطور ايديك هوه ⏬\n\n🧟‍♂│"..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس 📡" and msg.type == "pv" then
local inline = {{{text="⚜│قنآهہ‏‏ آلسـورس ضـغـط هـنـآ ",url="t.me/@uop70"}}}
send_key(msg.sender_user_id_,'  [⚜│قناة سورس : مـاكـس](t.me/@uop70)',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات 💥" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"♦️*│*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
return '🎭│الاحصائيات 🏌‍♂ \n\n👥*╿*عدد المجموعات المفعله : '..redis:scard(max..'group:ids')..'\n🙍🏻‍♂*╽*عدد المشتركين في البوت : '..redis:scard(max..'users')..'\n📡'
end
---------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام ➕" then
	if not msg.SudoBase then return"💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
redis:setex(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "📭│حسننا الان ارسل كلمة الرد العام 🍃\n"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
local names 	= redis:exists(max..'replay:'..msg.chat_id_)
local photo 	= redis:exists(max..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(max..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(max..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(max..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(max..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(max..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(max..'replay:'..msg.chat_id_,max..'replay_photo:group:'..msg.chat_id_,max..'replay_voice:group:'..msg.chat_id_,
max..'replay_animation:group:'..msg.chat_id_,max..'replay_audio:group:'..msg.chat_id_,max..'replay_sticker:group:'..msg.chat_id_,max..'replay_video:group:'..msg.chat_id_)
return "✓ تم مسح كل الردود 💥"
else
return '💥*┃* لا يوجد ردود ليتم مسحها \n💥'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return"♨️ للمطورين فقط ! 💯" end
local names 	= redis:exists(max..'replay:all')
local photo 	= redis:exists(max..'replay_photo:group:')
local voice 	= redis:exists(max..'replay_voice:group:')
local imation 	= redis:exists(max..'replay_animation:group:')
local audio 	= redis:exists(max..'replay_audio:group:')
local sticker 	= redis:exists(max..'replay_sticker:group:')
local video 	= redis:exists(max..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(max..'replay:all',max..'replay_photo:group:',max..'replay_voice:group:',max..'replay_animation:group:',max..'replay_audio:group:',max..'replay_sticker:group:',max..'replay_video:group:')
return "✓ تم مسح كل الردود العامه💥"
else
return "لا يوجد ردود عامه ليتم مسحها ! 💥"
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"💥*┃*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
redis:set(max..'delrdall:'..msg.sender_user_id_,true) 
return "💥┃حسننا عزيزي  ✋🏿\n🗯┃الان ارسل الرد لمسحها من  المجموعات 🍃"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
redis:set(max..'delrd:'..msg.sender_user_id_,true)
return "💥┃حسننا عزيزي  ✋🏿\n🗯┃الان ارسل الرد لمسحها من  للمجموعه 🍃"
end

if MsgText[1]== 'الردود' then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
local names  	= redis:hkeys(max..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(max..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(max..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(max..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(max..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(max..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(max..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '💥*┃*لا يوجد ردود مضافه حاليا \n💥' 
end
local ii = 1
local message = '💬*┃*ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره 🏞 ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص 🗯 ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه 🎙 ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه 🔊 ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه 🗨' then
	if not msg.SudoBase then return "♨️ للمطور فقط ! 💯" end
local names 	= redis:hkeys(max..'replay:all')
local photo 	= redis:hkeys(max..'replay_photo:group:')
local voice 	= redis:hkeys(max..'replay_voice:group:')
local imation 	= redis:hkeys(max..'replay_animation:group:')
local audio 	= redis:hkeys(max..'replay_audio:group:')
local sticker 	= redis:hkeys(max..'replay_sticker:group:')
local video 	= redis:hkeys(max..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
	return '🚸*│*لا يوجد ردود مضافه حاليا \n💥' 
end
local ii = 1
local message = '💬*┃*الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره 🏞 ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص 🗯 ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه 🎙 ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه 🎭 ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  🎞 ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end



if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "💥*┃*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
redis:setex(max..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(max..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "💥┃حسننا , الان ارسل كلمه الرد \n-"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
	if not msg.SudoBase then return"♦️*│*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
	redis:setex(max..'namebot:witting'..msg.sender_user_id_,300,true)
	return"📭╿حسننا عزيزي  ✋🏿\n🗯╽الان ارسل الاسم  للبوت 🍃"
	end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 ❪ Seystem ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*💥 ❪ Memory ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾 ❪ HardDisk ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️ ❪ Processor ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*👨🏾‍🔧 ❪ Server[_]Login ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌 ❪ Uptime ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟l ❪ نظام التشغيل ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*💥l ❪ الذاكره العشوائيه ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾l ❪ وحـده الـتـخـزيـن ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️l ❪ الـمــعــالــج ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*👨🏾‍🔧l ❪ الــدخــول ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌l ❪ مـده تـشغيـل الـسـيـرفـر ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
	if MsgText[1] == "الاوامر" then
	if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
	local texs = [[  ‌‌‏‌‌‏‌‌‌‌‏                                    
										 ‌‌‏┄─┅══┅─┄
	👨‍💻↫‌‌‏مـسـآرت آلآوآمـر آلعآمـهہ‌‏ ⇊
	┄─┅═ـ═┅─┄
	👨‍⚖️╿م1 » آوآمـر آلآدآرهہ‌‏
	📟│م2 » آوآمـر آعدآدآت آلمـجمـوعهہ‌‏
	🛡│م3 » آوآمـر آلحمـآيهہ‌‏
	🔰│م4 » آوآمر آلخدمه 
	 ]]
	 keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⓵', callback_data="/help1@"..msg.sender_user_id_},{text = '⓶', callback_data="/help2@"..msg.sender_user_id_},{text = '⓷', callback_data="/help3@"..msg.sender_user_id_},
},
{
{text = '⓸', callback_data="/help4@"..msg.sender_user_id_},{text = '⓹', callback_data="/help5@"..msg.sender_user_id_},
},
{
{text = '⓺', callback_data="/help6@"..msg.sender_user_id_},{text = '⓻', callback_data="/help7@"..msg.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5
https.request(ApiToken..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(texs).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if MsgText[1]== 'م1' then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local text =[[
┄─┅══┅─┄     
¹↫❬آوآمر الرفع والتنزيل❭
┄─┅═ـ═┅─┄
👨‍🔧│رفع «» تنزيل ❬منشئ اساسي❭ 
👨‍🔧│رفع «» تنزيل ❬منشئ❭ 
👷‍♂╿رفع «» تنزيل ❬المدير❭
👨‍🔧│رفع «» تنزيل ❬ادمن❭ 
👨‍💼│رفع «» تنزيل ❬مميز❭ 
┄─┅═ـ═┅─┄
²↫ ❬آو꯭آم꯭ـر آ꯭لم꯭ـس꯭ـح꯭ للم꯭ـنش꯭ـئ❭
┄─┅═ـ═┅─┄
🗑│مسح الادمنـيـه «» ❬لمسح الادمنيه❭
🗑│مسح المميزين «» ❬لمسح المميزين❭
🗑│مسح المــــدراء «» ❬لمسح المدراء❭
┄─┅═ـ═┅─┄
³↫ ❬آوآمـر آلحظـر وآلطــرد وآلتقييد❭
┄─┅═ـ═┅─┄
🤦‍♂│حظر ❬بالرد «» بالمعرف❭ لحظر العضو
🙆‍♂│الغاء الحظر ❬بالرد «» بالمعرف❭ لالغاء الحظر 
🏌‍♂│طرد ❬بالرد «» بالمعرف❭ لطرد العضو
🔇│كتم ❬بالرد «» بالمعرف❭ لكتم العضو 
🔊│الغاء الكتم ❬بالرد«»بالمعرف❭لالغاء الكتم 
🚷│تقييد ❬بالرد «» بالمعرف❭ لتقييد العضو
🔓│فك التقييد ❬بالرد «» بالمعرف❭ لالغاء تقييد العضو
🚫│منع + الكلمه «» لمنع كلمه داخل المجموعه
⭕️╽الغاء منع «» لالغاء منع الكلمه
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local text = [[
┄─┅══┅─┄
👨‍💻↫❬اوامر رؤية الاعدادات❭
┄─┅═ـ═┅─┄
🔮╿الـرابـط «» لعرض ❬الرابط❭  
🔗│انشاء رابط «» لستخراج ❬الرابط❭  
👨‍🔧│الادمنيه «» لعرض ❬الادمنيه❭
🧾│القوانين «» لعرض ❬القوانين❭ 
🌄│الوسائط «» لعرض اعدادات ❬الميديا❭ 
👨‍💻│الحمايـه «» لعرض كل ❬الاعدادات❭  
👷‍♂│المــدراء «» لعرض ❬الاداريين❭ 
🤐│المكتومين «» لعـرض ❬المكتومين❭ 
🥺│المحظورين «» لعرض ❬المحظورين❭
🛠│الاعدادات «» لعرض اعدادات❬المجموعه❭ 
👥│المجموعه «» لعرض معلومات❬المجموعه❭
👨‍💻│تغير امر. + الامر «» لتغير❬اوامر البوت❭
⌨│مسح امر + الامر «» لمسح❬الامر المضاف❭
💻╽قائمـه الاوامر «» لمعرفه❬الاوامرالمضافه❭
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local text = [[
┄─┅══┅─┄
¹↫❬اوامر حمايـه المجموعه❭
┄─┅═ـ═┅─┄     
📵╿قفل «» فتح ❬الكـــل❭
🙋‍♂│قفل «» فتح ❬التـاك❭
📽│قفل «» فتح ❬الفيـديـــو❭
🌄│قفل «» فتح ❬الصــــــــور❭
🚫│قفل «» فتح ❬الملصقات❭
🎭│قفل «» فتح ❬المتحركه❭
🔇│قفل «» فتح ❬البصمــات❭
🙋‍♂│قفل «» فتح ❬تعديل الميديا❭
🤐│قفل «» فتح ❬الدردشـــه❭
🖇│قفل «» فتح ❬الــروابـــط❭
🤖│قفل «» فتح ❬البـــوتــات❭
🖊│قفل «» فتح ❬التعــديــل❭
🎫│قفل «» فتح ❬المعرفــات❭
🎫│قفل «» فتح ❬المعرفــات❭
🎫│قفل «» فتح ❬الـــفارسيه❭
🎫│قفل «» فتح ❬الفــشـــــار❭
🎫│قفل «» فتح ❬تعديل الميديا❭
📝│قفل «» فتح ❬الكـــلايـش❭
♻️│قفل «» فتح ❬التـــكـــــرار❭
📞│قفل «» فتح ❬الجــهـــــات❭
🌐│قفل «» فتح ❬الانـــلايــن❭
🔚│قفل «» فتح ❬التوجيــــه❭
🚫│قفل «» فتح ❬الدخول بالرابط❭
🏌‍♂╽قفل «» فتح ❬البوتات بالطرد❭
┄─┅═ـ═┅─┄     
²↫❬القفل بالتقييـد❭
┄─┅═ـ═┅─┄                                                                                        
📸╿قفل «» فتح ❬الــصــــــور بالتقييـد❭
🔗│قفل «» فتح ❬الــروابــط بالتقييـد❭
🎭│قفل «» فتح ❬المتحركه بالتقييـد❭
📽│قفل «» فتح ❬الفيـــديــو بالتقييد❭
🔒╽قفل «» فتح ❬التوجيــه بالتقييــد❭ 
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' then
if not msg.Director then return "♦️*│*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
local text = [[
┄─┅══┅─┄
👨‍💻↫❬اوامر الخدمــه❭ 
┄─┅═ـ═┅─┄
🎟╿ايـــدي «» لعرض صورتك -:- معلوماتك
🎫│ايديـي «» لعرض ايديك 
💳│ايدي بالرد «» لعرض ايدي الشخص
🔗│الرابط «» لستخراج رابط المجموعه
📞│جهاتي «» لمعرفه عدد جهاتك
🕹│الالعاب «» لعرض العاب البوت
😍│بحث + اسم الاغنيه «» لبحث انواع الاغاني
🧮│نقاطي «» لمعرفه عدد نقاطك
🧮│بيع نقاطي + العدد «» لبيع نقاطك لتحصل على رسائل
💳│معلوماتي «» لعرض معلوماتك
📟│السورس «» لعرض سورس البوت
🎖│الرتبه بالرد «» لمعرفه رتبه الشخص
📊│التفاعل -:- بالمعرف «» لمعرفه تفاعل الشخص
📈│التفاعل بالــرد «» لمعرفه تفاعل الشخص
💢│كشف بالمعرف «» لمعرفه معلومات حسابه
👁‍🗨│كشف بالرد «» لمعرفه معلومات حسابه
🤖│كشف البوتات «» لاظهار عدد البوتات الموجوده بالمجموعه
🏌‍♂│طرد البوتات «» لطرد كل البوتات
🏌‍♀│طرد المحذوفين «» لطرد الحسابات المحذوفه
🔗│رابط الحذف «» لحذف حساب تلكرام
🎨╽زخرفه «» لزخرفه اي شي تريد
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م5' then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local text =[[
┄─┅══┅─┄
🤪╿❬ آوآمر التحشيش❭
🙋🏽‍♂│مرحبآ عزيزي ،
💯╽إليـك اوامر التحشيش كـ التالي
┄─┅═ـ═┅─┄
🤴╿رفع «» تنزيل ❬ تـــاج ❭
👰│رفع «» تنزيل ❬ مرتي ❭
🤪│رفع «» تنزيل ❬ اثـول ❭
🐕│رفع «» تنزيل ❬ جلـب ❭
🦓│رفع «» تنزيل ❬ مطـي ❭
🐐│رفع «» تنزيل ❬ صخـل ❭
🦎│رفع «» تنزيل ❬ زاحف ❭
❤️│رفع «» ❬ بكلبي ❭ تنزيل «» ❬ من كلبي❭
🎈╽❬ طلاك ❭ «» ❬ زواج ❭
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م6' then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local text = [[
┄─┅══┅─┄     
👨‍💻↫ آوآمر آلتعطيل و آلتفعيل
┄─┅═ـ═┅─┄
👥╿تفعيل «» تعطيل  ❬ الرفــع ❭
🗣│تفعيل «» تعطيل  ❬ الردود ❭
🕹│تفعيل «» تعطيل  ❬الالعـاب❭
📢│تفعيل «» تعطيل  ❬ التحذير ❭
👋│تفعيل «» تعطيل  ❬ الترحيب ❭
🆔│تفعيل «» تعطيل  ❬ الايدي ❭
🌅╽تفعيل «» تعطيل  ❬ الايدي بالصوره ❭
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م7' then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local text = [[
┄─┅══┅─┄
👨‍💻↫ آوآمر ❬ اوامر الوضع للمجموعه ❭
┄─┅═ـ═┅─┄
🔗╿ضع رابـط «» لوضع ❬ رابط ❭
💳│ضع اســـم «» لوضع ❬ اســم ❭
🏞│ضع صوره «» لوضع ❬ صوره ❭
📡│ضع وصـف «» لوضع ❬ وصف ❭ 
🧾│ضع القوانيــن «» لوضع ❬ القوانين ❭ 
👋│ضع الترحيب «» لوضع ❬ ترحيــب ❭
💫╽ضع تكرار + العدد «» لوضع ❬ تكرار ❭
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "🔅│للمطور الاساسي فقط  🎖" end
local text = [[
┄─┅══┅─┄     
👨‍💻↫ ❬اوامـر المطـور❭ 
┄─┅═ـ═┅─┄
📛╿تفعيـل «» ❬لتفعيل البوت ❭
🚫│تعطيل «» ❬لتعطيل البوت ❭
⚠️│اسم بوتك + غادر «» ❬لطرد البوت❭
👁‍🗨╽رفع منشى «» ❬رفع منشى بالبوت❭
┄─┅═ـ═┅─┄
🔊╿اذاعه «» ❬لنشر رساله لكل المجموعات❭
📢│اذاعه خاص «» ❬ لنشر رساله لكل المشتركين خاص❭
📣│اذاعه عام «» ❬لنشر رساله لكل المجموعات والخاص❭
🔈│اذاعه عام بالتوجيه «» ❬لنشر منشور قناتك بابتوجيه للكل❭
🀄️│تنظيف المجموعات«»  ❬لمسح المجموعات الوهميه❭
⚙╽تنظيف المشتركين «» ❬لمسح المشتركين الوهميين❭
┄─┅═ـ═┅─┄
♻️╿تحديث «» ❬لتحديث ملفات البوت❭
💭╽تحديث السورس «» ❬لتحديث السورس الى اصدار احدث❭
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "♦️*│*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n💥" end
local text = [[
┄─┅══┅─┄     
👨‍💻↫❬جميع اوامر الردود ❭
┄─┅═ـ═┅─┄
🔻╿الردود «» لعرض الردود المثبته
♦️│اضف رد «» لأضافه رد جديد
♦️│مسح رد «» الرد المراد مسحه
♦️│مسح الردود «» لمسح كل الردود
♦️│الردود العامه «» لمعرف الردود المثبته عام 
♦️│اضف رد عام «» لاضافه رد لكل المجموعات
♦️│مسح رد عام  «» لمسح الرد العام 
🔺╽مسح الردود العامه «» لمسح كل ردود العامه
┄─┅═ـ═┅─┄
💭*│* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if not redis:get(max..'lave_me'..msg.chat_id_) then 
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* المغادره بالتاكيد تم تفعيلها\n✓" 
else 
redis:del(max..'lave_me'..msg.chat_id_) 
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* تم تفعيل المغادره \n✓" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "💥*┃*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
if redis:get(max..'lave_me'..msg.chat_id_) then 
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* المغادره من قبل البوت بالتأكيد معطله\n✓" 
else
redis:set(max..'lave_me'..msg.chat_id_,true)  
return "💥*┃*أهلا عزيزي "..msg.TheRankCmd.."\n💥*┃* تم تعطيل المغادره من قبل البوت\n✓" 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(max..'lave_me'..msg.chat_id_) then
if msg.Admin then return "💥*┃*لا استطيع طرد المدراء والادمنيه والمنشئين  \n💥" end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"👨🏼‍⚕️┃اهلا عزيزي , لقد تم طردك من المجموعه بامر منك \n💥┃اذا كان هذا بالخطأ او اردت الرجوع للمجموعه \n\n💥┃فهذا رابط المجموعه 💯\n🌿┃"..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(max..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"💥| لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"💥| لا استطيع طردك لانك مشرف في المجموعه  ")
end
end)
return false
end
end

end 

if MsgText[1] == "سورس" or MsgText[1]=="السورس" then
	return [[
	┄─┅══┅─┄     
	👋│اهلا بك في سورس ماكـس 😍
	●ـ▬ـ▬ஜ۩۞۩ஜ▬ـ▬ـ●
	📡╿[قناة السورس](t.me/uop70)
	⚜│[قناة شروحات السورس](t.me/uop60)
	🤖│[بوت تواصل](t.me/TUaSiLMaXbot)
	👨🏻‍✈️╽[مطور السـورس](t.me/Hskh56)
	●ـ▬ــ▬ஜ۩۞۩ஜ▬ـ▬ـ●
	
	]]
end


if MsgText[1] == "التاريخ" then
return "➖\n💥 | الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "سحكاتي" then
return '💥*┃*عدد سحہكآتگ 〃 ❪ '..(redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n🐾'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'سحكاتي'  then
local rfih = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "💥*┃*عذرا لا يوجد سحكات لك في البوت  💥" end
redis:del(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "💥*┃*تم مسح {* "..rfih.." *} من سحكاتك ☔️\n✓"
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑" then
	if not msg.SudoBase then return"♦️*│*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
	if redis:get(max..":UserNameChaneel") then
	return "📑╿اهلا عزيزي المطور \n🔖╽الاشتراك بالتأكيد مفعل"
	else
	redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
	return "📑╿مرحبا بـك في نظام الاشتراك الاجباري\n🔖╽الان ارسل معرف قـنـاتـك"
	end
	end
	
	if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري ♻️" then
	if not msg.SudoBase then return"♦️*│*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
	local SubDel = redis:del(max..":UserNameChaneel")
	if SubDel == 1 then
	return "🔖│تم تعطيل الاشتراك الاجباري . \n✓"
	else
	return "🔖│الاشتراك الاجباري بالفعل معطل . \n✓"
	end
	end
	
	if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري ⚠️" then
	if not msg.SudoBase then return"♦️*│*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
	local UserChaneel = redis:get(max..":UserNameChaneel")
	if UserChaneel then
	return "🔖╿اهلا عزيزي المطور \n🔖╽الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n✓"
	else
	return "🔖│لا يوجد قناة مفعله ع الاشتراك الاجباري. \n✓"
	end
	end
	
	if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري 🔁" then
	if not msg.SudoBase then return"♦️*│*هذا الامر يخص {المطور الاساسي} فقط  \n💥" end
	redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
	return "📑╿مرحبا بـك في نظام الاشتراك الاجباري\n🔖╽الان ارسل معرف قـنـاتـك"
	end





end

local function dmax(msg)



local getChatId = function(id)
  local chat = {}
  local id = tostring(id)
  if id:match("^-100") then
    local channel_id = id:gsub("-100", "")
    chat = {ID = channel_id, type = "channel"}
  else
    local group_id = id:gsub("-", "")
    chat = {ID = group_id, type = "group"}
  end
  return chat
end
local getChannelFull = function(channel_id, cb)
  tdcli_function({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, cb or dl_cb, nil)
end

local getUser = function(user_id, cb)
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil)
end
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end


if redis:get(max..'welc'..msg.chat_id_) == 'on' then
if msg.content_.ID == 'MessageChatJoinByLink' then
function WelcomeByAddUser(BlaCk,Diamond)
local function setlinkgp(td,mrr619)
function gps(arg,data)

txt = '👋┓ اهلآ عزيزي '..(Diamond.first_name_ or '---')..'\n💥┫ المجموعه  '..(data.title_ or '---')..' \n🤫┫ احترام الادمنيه\n😡┫ ممنوع طلب الرتب\n🤐┫ ممنوع السب والكفران \n😒┫ ممنوع التكلم بالطائفيه\n🙏┫ الاعضاء '..mrr619.member_count_..' عضو\n👮‍┫ الادمنيه '..mrr619.administrator_count_..' \n⏱┫ وقت الانضمام :【*'..os.date("%H:%M:%S")..'*】\n📅┛ تاريخ الانضمام :【*'..os.date("%Y/%m/%d")..'*】\n'
sendMsg(msg.chat_id_,msg.id_,txt)
end
getChat(msg.chat_id_,gps)
end
getChannelFull(msg.chat_id_,setlinkgp)
end
getUser(msg.sender_user_id_,WelcomeByAddUser)
end
end



local Text = msg.text
if Text then


if Text and (Text:match('(.*)')) and tonumber(msg.sender_user_id_) ~= 0 then
function dl_username(arg,data)
if data.username_ then
info = data.username_
else
info = data.first_name_
end
local hash = max..'user_names:'..msg.sender_user_id_
redis:set(hash,info)
end
getUser(msg.sender_user_id_,dl_username)
end

------set cmd------
Black = msg.text 
mmd = redis:get(max..'addcmd'..msg.chat_id_..msg.sender_user_id_)
if mmd then
redis:sadd(max..'CmDlist:'..msg.chat_id_,msg.text)
redis:hset(max..'CmD:'..msg.chat_id_,msg.text,mmd)
sendMsg(msg.chat_id_,msg.id_,'💥┃اهلا عزيزي \n💥┃تم تثبيت الامر الجديد\n✓')
redis:del(max..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end

if Black:match('تغير امر (.*)') then
if not msg.malk then return "💥*┃*هذا الامر يخص {المالك و المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n💥" endlocal cmd = Black:match('تغير امر (.*)') 
redis:setex(max..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'💥┃اهلا بك عزيزي\n💥┃الامر الي تريد تغيره الي  >'..cmd..'< \n💥┃ارسله الان\n✓ ')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')) then
if not msg.malk then return "💥*┃*هذا الامر يخص {المالك و المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n💥" endlocal cmd = Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')
redis:hdel(max..'CmD:'..msg.chat_id_,cmd)
redis:srem(max..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"💥┃اهلا عزيزي\nالامر >"..cmd.."\n💥┃ تم مسحه من قائمه الاوامر\n✓")
end
if Black == 'مسح قائمه الاوامر' or Black == 'مسح قائمه الاوامر' then
if not msg.malk then return "💥*┃*هذا الامر يخص {المالك و المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n💥" endredis:del(max..'CmD:'..msg.chat_id_)
redis:del(max..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"💥| اهلا عزيزي تم مسح قائمه الاوامر")
end
if Black == "قائمه الاوامر" then
if not msg.malk then return "💥*┃*هذا الامر يخص {المالك و المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n💥" endlocal CmDlist = redis:smembers(max..'CmDlist:'..msg.chat_id_)
local t = '💥| قائمه الاوامر : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(max..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '⛔| عزيزي لم تقم ب اضافه امر !'
end
sendMsg(msg.chat_id_,msg.id_,t)
end




if Black == 'welcome on' or Black == 'تفعيل الترحيب' then
if redis:get(max..'welc'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب سابقا')
else
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب')
redis:set(max..'welc'..msg.chat_id_,'on')
end
end
if Text == 'welcome off' or Text == 'تعطيل الترحيب' then
if redis:get(max..'welc'..msg.chat_id_) == 'off' then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب سابقا')
redis:set(max..'welc'..msg.chat_id_,'off')
redis:del(max..'welc'..msg.chat_id_,'on')
else
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب')
end
end

if Text == "join on" and msg.SudoUser then
redis:set(max..'joinchnl',true)
sendMsg(msg.chat_id_,msg.id_,'on')
end
if Text and redis:get(max..'setchs') and msg.SudoUser then
redis:set(max..'setch',Text)
sendMsg(msg.chat_id_,msg.id_,'تم تعين القناه علي \n'..Text)
redis:del(max..'setchs')
end
if Text and (Text:match("^setch$")) and msg.SudoUser then
sendMsg(msg.chat_id_,msg.id_,'ارسل معرفك بدون @')
redis:setex(max..'setchs',120,true)
end


if Text == 'time' or Text == 'الوقت' and is_JoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}'	
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^تحويل ملصق$') and tonumber(msg.reply_to_message_id_) > 0 then
whoami()
BD = '/home/root/.telegram-cli/data/'
function tosticker(arg,data)
if data.content_.ID == 'MessagePhoto' then
if BD..'photo/'..data.content_.photo_.id_..'_(1).jpg' == '' then
pathf = BD..'photo/'..data.content_.photo_.id_..'.jpg'
else
pathf = BD..'photo/'..data.content_.photo_.id_..'_(1).jpg'
end
sendSticker(msg.chat_id_,msg.id_,pathf,'')
else
sendMsg(msg.chat_id_,msg.id_,'💥┃عزيزي المستخدم👨🏻‍✈️ \n📌┃الامر فقط للصوره\n✓')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

if Text == 'tophoto' or Text == 'صوره' and tonumber(msg.reply_to_message_id_) > 0 then
function tophoto(kara,max)   
if max.content_.ID == "MessageSticker" then        
local bd = max.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'💥┃عزيزي المستخدم👨🏻‍✈️ \n📌┃الامر فقط للملصق\n✓')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if Text == "all" or Text == "@all" and msg.Admin then
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,amir)
x = 0
tags = 0
local list = amir.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
sendMsg(msg.chat_id_,Text,0,'md')
end
end,nil)
end
end,nil)
end,nil)
end

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(max..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*💥┃* تم حظرك من البوت بسبب التكرار \n💥') 
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then 

if msg.SudoBase then
local text = '🙋🏻‍♂╿ئمنور حبي ♥\n🔻 |  آنت آلمـطـور آلآسـآسـي هنآ 🛠\n┄─┅═ـ═┅─┄\n\n🚸  |  تسـتطـيع‌‏ آلتحگم بكل آلآوآمـر آلمـمـوجودهہ‌‏ بآلگيبورد الخاص بالبوت\n🔺╽فقط آضـغط ع آلآمـر آلذي تريد تنفيذهہ‌‏'
local keyboard = {
	{"ضع اسم للبوت ©","ضع صوره للترحيب 🌄"},
	 {"تعطيل التواصل ✖️","تفعيل التواصل 🔛"},
	{"تعطيل البوت خدمي","تفعيل البوت خدمي","المطورين 🔥"},
	 {"المشتركين Ⓜ","المجموعات 🌋","الاحصائيات 💥"},
	 {"اضف رد عام ➕","الردود العامه 🗨"},
	 {"اذاعه 🗣","اذاعه خاص 🗣"},
	{"اذاعه عام 📢","اذاعه عام بالتوجيه 📣"},
	 {"تحديث ♻️","قائمه العام 📜","ايديي🆔"},
	{"تعطيل الاشتراك الاجباري ♻️","تفعيل الاشتراك الاجباري ☑"},
	{"تغيير الاشتراك الاجباري 🔁","الاشتراك الاجباري ⚠️"},
	{"تنظيف المشتركين 🗑","تنظيف المجموعات 🗑"},
	 {"نسخه احتياطيه للمجموعات"},
	 {"قناة السورس 📡"},
	 {"تحديث السورس 🔂"},
	 {"الغاء الامر ✖️"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(max..'users',msg.sender_user_id_)
if redis:get(max..'lock_service') then 
	text = [[🤖╿آهلا انآ بــــوت آســمـي   []]..redis:get(max..':NameBot:')..[[] 🗽
	⛓│ آختـصاصـي حمايـه آلمجـموعـات ..
	🛡│ مـن آلسـبآم وآلتوجيه وآلتكرآر وآلخ
	🚸╽ لتفعيل آلبوت آتبــع الشـروط ❕
	¹↫ ❬اضف البوت الى المجموعه❭ 🤔
	²↫ ❬ارفع البوت ادمن في المجموعه❭♻️
	³↫ ❬وارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي الكروب تلقائين ❭ 🔱
	
	ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
	 ⚖│مـعـرف الـمـطـــور ↫ ]]..SUDO_USER..[[
	]]
	else
	text = [[🤖╿آهلا انآ بــــوت آســمـي   []]..redis:get(max..':NameBot:')..[[] 🗽
	⛓│ آختـصاصـي حمايـه آلمجـموعـات ..
	🛡│ مـن آلسـبآم وآلتوجيه وآلتكرآر وآلخ
	🚸╽ لتفعيل آلبوت آتبــع الشـروط ❕
	¹↫ ❬اضف البوت الى المجموعه❭ 🤔
	²↫ ❬ارفع البوت ادمن في المجموعه❭♻️
	³↫ ❬وارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي الكروب تلقائين ❭ 🔱
	
	ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
	 ⚖│مـعـرف الـمـطـــور ↫ ]]..SUDO_USER..[[
	]]
	end
	xsudouser = SUDO_USER:gsub('@','')
	xsudouser = xsudouser:gsub([[\_]],'_')
	local inline = {{{text="مـطـور الـبـوت ✓",url="t.me/"..xsudouser}}}
	send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
	return false
	end
	end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(max.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"📬┃تم آرسـآل آلرسـآل‏‏هہ 🌿\n🎟┃آلى : "..USERNAME.." 🏌🏻",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(max..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"💥┃عذرآ لآ يمـگنگ آرسـآل { توجيهہ‌‏ , مـلصـق , فديو گآم} ❗️")
return false
end
redis:setex(max.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"🗯┃تم آرسـآل رسـآلتگ آلى آلمـطـور\n📬┃سـآرد عليگ في آقرب وقت\n👨‍✈️┃معرف المطور "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

function CaptionInsert(msg,input,public)
if msg.content_ and msg.content_.caption_ then 
if public then
redis:hset(max..':caption_replay:Random:'..msg.klma,input,msg.content_.caption_) 
else
redis:hset(max..':caption_replay:Random:'..msg.chat_id_..msg.klma,input,msg.content_.caption_) 
end
end
end

--====================== End Reply Random Only Group =====================================

--====================== Reply Only Group ====================================
if redis:get(max..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.content_ and msg.content_.caption_ then redis:hset(max..':caption_replay:'..msg.chat_id_,klma,msg.content_.caption_) end
if msg.text then 
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"📛¦ عذرا غير مسموح باضافه جواب الرد باكثر من 4000 حرف تم الغاء الامر\n❕")
end
redis:hset(max..'replay:'..msg.chat_id_,klma,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ✓ تم اضافت الرد 🚀 \n-')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:hset(max..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه صوره للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.content_.ID == "MessageVoice" then
redis:hset(max..'replay_voice:group:'..msg.chat_id_,klma,msg.content_.voice_.voice_.persistent_id_)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه بصمه صوت للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لسماع البصمه الاتيه .')
elseif msg.content_.ID == "MessageAnimation" then
redis:hset(max..'replay_animation:group:'..msg.chat_id_,klma,msg.content_.animation_.animation_.persistent_id_)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه متحركه للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.content_.ID == "MessageVideo" then
redis:hset(max..'replay_video:group:'..msg.chat_id_,klma,msg.content_.video_.video_.persistent_id_)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه فيديو للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الفيديو الاتي .')
elseif msg.content_.ID == "MessageAudio" then
redis:hset(max..'replay_audio:group:'..msg.chat_id_,klma,msg.content_.audio_.audio_.persistent_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه للصوت للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوت الاتي .')
elseif msg.content_.ID == "MessageDocument" then
redis:hset(max..'replay_files:group:'..msg.chat_id_,klma,msg.content_.document_.document_.persistent_id_ )
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه ملف للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الملف الاتي .')  
elseif msg.content_.ID == "MessageSticker" then
redis:hset(max..'replay_sticker:group:'..msg.chat_id_,klma,msg.content_.sticker_.sticker_.persistent_id_)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه ملصق للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الملصق الاتي .')
end  

end

--====================== Reply All Groups =====================================
if redis:get(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.caption_ then redis:hset(max..':caption_replay:'..msg.chat_id_,klma,msg.content_.caption_) end
if msg.text then
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"📛¦ عذرا غير مسموح باضافه جواب الرد باكثر من 4000 حرف تم الغاء الامر\n❕")
end
redis:hset(max..'replay:all',klma,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ✓ تم اضافت الرد لكل المجموعات 🚀 ')
elseif msg.content_.ID == "MessagePhoto" then 
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:hset(max..'replay_photo:group:',klma,photo_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه صوره للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.content_.ID == "MessageVoice" then
redis:hset(max..'replay_voice:group:',klma,msg.content_.voice_.voice_.persistent_id_)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه بصمه صوت للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لسماع البصمه الاتيه .')
elseif msg.content_.ID == "MessageAnimation" then
redis:hset(max..'replay_animation:group:',klma,msg.content_.animation_.animation_.persistent_id_)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه متحركه للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.content_.ID == "MessageVideo" then
redis:hset(max..'replay_video:group:',klma,msg.content_.video_.video_.persistent_id_)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه فيديو للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الفيديو الاتي .')
elseif msg.content_.ID == "MessageAudio" then
redis:hset(max..'replay_audio:group:',klma,msg.content_.audio_.audio_.persistent_id_)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه للصوت للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوت الاتي .')
elseif msg.content_.ID == "MessageDocument" then
redis:hset(max..'replay_files:group:',klma,msg.content_.document_.document_.persistent_id_ )
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه ملف للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار ملف الاتي .')  
elseif msg.content_.ID == "MessageSticker" then
redis:hset(max..'replay_sticker:group:',klma,msg.content_.sticker_.sticker_.persistent_id_)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه ملصق للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الملصق الاتي .')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
local Text = msg.text
local UserID =  msg.sender_user_id_
if msg.Creator then
if Text == "تعيين الايدي" and msg.SudoUser then
redis:setex("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
local hasnid= [[
*💥¦ اهلابك عزيزي  
💥¦تستطيع الان تغير كليشه الايدي 💥
---------------------
 •  الايدي •* `IDGET`
*• رتبتي • * `RTBGET`
*• المعرف • * `USERGET`
*• رسائلك • * `MSGGET`
*•سحكاتك • * `edited`
*• تفاعلك • * `TFGET`
*• جهاتك • * `adduser`
*•مجوهراتك • * `User_Points`

]]
return sendMsg(msg.chat_id_,msg.id_,hasnid) 
end
if Text == "مسح الايدي" and msg.SudoUser then
redis:del("KLISH:ID")
sendMsg(msg.chat_id_,msg.id_,"💥*¦* أهلا عزيزي "..msg.TheRankCmd.."\n💥*¦* تم  حذف كليشه الايدي \n✓")
return false  
end
if redis:get("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) then 
if Text == "الغاء" then 
sendMsg(msg.chat_id_,msg.id_,"*💥¦ تم الغاء الامر *\n✓")
redis:del("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end 
redis:del("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
local CHENGER_ID = Text:match("(.*)")  
redis:set("KLISH:ID",CHENGER_ID)
sendMsg(msg.chat_id_,msg.id_,'\n*🏌️‍♀️¦ تم تغير كليشه الايدي بنجاح*\n')
end

end

if msg.content_.ID == "MessageChatAddMembers" then  
redis:set(max.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = redis:get(max.."lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
BESSO = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(BESSO)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end

if text == 'منو ضافني' then
if not redis:get(max..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(msg.chat_id_, msg.id_,'⚠¦ انت منشئ المجموعه ') 
return false
end
local Added_Me = redis:get(max.."Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = '👤¦ الشخص الذي قام باضافتك هو » '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
send(msg.chat_id_, msg.id_,'📌¦ انت دخلت عبر الرابط') 
end
end,nil)
else
send(msg.chat_id_, msg.id_,'⚠¦ امر منو ضافني تم تعطيله من قبل المدراء ') 
end
end

if text == "تفعيل ضافني" then   
if redis:get(max..'Added:Me'..msg.chat_id_) then
sendMsg(msg.chat_id_,msg.id_,"💥*¦* أهلا عزيزي "..msg.TheRankCmd.."\n💥*¦* تم  تفعيل امر منو ضافني\n✓")
redis:del(max..'Added:Me'..msg.chat_id_)  
else
sendMsg(msg.chat_id_,msg.id_,"💥*¦* أهلا عزيزي "..msg.TheRankCmd.."\n💥*¦* تم  تفعيل منو ضافني سابقا \n✓")
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ضافني' then  
if not redis:get(max..'Added:Me'..msg.chat_id_) then
redis:set(max..'Added:Me'..msg.chat_id_,true)  
sendMsg(msg.chat_id_,msg.id_,"💥*¦* أهلا عزيزي "..msg.TheRankCmd.."\n💥*¦* تم  تعطيل منو ضافني\n✓")
else
sendMsg(msg.chat_id_,msg.id_,"💥*¦* أهلا عزيزي "..msg.TheRankCmd.."\n💥*¦* تم تعطيل منو ضافني سابقا\n✓")
end
send(msg.chat_id_, msg.id_,Text) 
end

if redis:get(max..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(max..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"💥┃عذرا , هناك خطأ لديك \n💥┃المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"💥┃عذرا , لقد نسيت شيئا \n💥┃يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(max..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"💥┃جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\n💥┃على قناتك 〃 ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"💥┃عذرا , عزيزي المطور \n💥┃هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(max..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(max..'namebot:witting'..msg.sender_user_id_)
redis:set(max..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"💥┃تم تغير اسم البوت  ✋🏿\n🗯┃الان اسمه "..Flter_Markdown(msg.text).." \n✓")
return false
end

if redis:get(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
redis:setex(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"💥┃جيد , يمكنك الان ارسال جوا ب الردالعام \n💥┃[[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n✓")
end
end

if redis:get(max..'delrdall:'..msg.sender_user_id_) then
redis:del(max..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(max..'replay:all',msg.text)
local photo =redis:hget(max..'replay_photo:group:',msg.text)
local voice = redis:hget(max..'replay_voice:group:',msg.text)
local animation = redis:hget(max..'replay_animation:group:',msg.text)
local audio = redis:hget(max..'replay_audio:group:',msg.text)
local sticker = redis:hget(max..'replay_sticker:group:',msg.text)
local video = redis:hget(max..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'💬*┃*هذا الرد ليس مضاف في قائمه الردود 💥')
else
redis:hdel(max..'replay:all',msg.text)
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n  ✓ تم مسح الرد 💥 ')
end 
end 


if redis:get(max..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(max..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(max..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "💥*┃* تم وضع الكليشه بنجاح كلاتي 👋🏻\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n✓")
end
if redis:get(max..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(max..'welcom:witting'..msg.sender_user_id_) 
redis:set(max..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"💥*┃* تم وضع الترحيب بنجاح كلاتي 👋\n✓" )
end
if redis:get(max..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(max..'rulse:witting'..msg.sender_user_id_) 
redis:set(max..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* مرحبآ عزيزي\n📦┃تم حفظ القوانين بنجاح ✓\n💥┃ارسل [[ القوانين ]] لعرضها \n💬✓')
end
if redis:get(max..'name:witting'..msg.chat_id_..msg.sender_user_id_) then ---استقبال الاسم
redis:del(max..'name:witting'..msg.chat_id_..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(max..'linkGroup'..msg.sender_user_id_,link) then --- استقبال الرابط
redis:del(max..'linkGroup'..msg.sender_user_id_,link) 
redis:set(max..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'🖇┃تم وضع الرابط الجديد بنجاح .. 🍂')
end
if redis:get(max..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(max..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"💥*┃* تم وضع الوصف بنجاح\n✓")
end 
end,nil)
end


if redis:get(max..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(max..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')  
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'💥┃اهلا عزيزي المطور \n💥┃جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(max..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'💥*┃*تم اذاعه الكليشه بنجاح 🏌🏻\n💥*┃*للمـجمـوعآت » ❴ *'..#groups..'* ❵ گروب \n💥*┃* للمـشـترگين » ❴ '..#pv..' ❵ مـشـترگ \n✓')
end

if redis:get(max..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(max..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'💥┃اهلا عزيزي المطور \n💥┃جاري نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(max..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'🙍🏻‍♂*┃*عدد المشتركين : ❴ '..#pv..' ❵\n💥*┃*تم الاذاعه الى ❴ '..SenderOk..'  ❵ مشترك \n ✓') 
end
end)
end
end

if redis:get(max..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(max..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(max..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'💥┃اهلا عزيزي المطور \n💥┃جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = '💥*┃*تم حذف ❴ *'..NumGroupsDel..'* ❵ من قائمه الاذاعه لانهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'💥*┃*عدد المجموعات ❴ *'..#groups..'* ❵\n💥*┃*تـم الاذاعه الى ❴ *'..AllGroupSend..'* ❵\n'..MsgTDel..'✓')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(max..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(max..':WELCOME_BOT'),[[💥┃اهلا انآ بوت آسـمـي ]]..redis:get(max..':NameBot:')..[[ ✓
👨🏻‍✈️┃آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
💥┃مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...

🎭┃مـعـرف الـمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
]])
return false
end 

if msg.forward_info and redis:get(max..'fwd:'..msg.sender_user_id_) then
redis:del(max..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'💥┃اهلا عزيزي المطور \n💥┃جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'💥*┃*تم اذاعه التوجيه بنجاح 🏌🏻\n💥*┃*للمـجمـوعآت » ❴ *'..#groups..'* ❵\n💥*┃*للخآص » ❴ '..#pv..' ❵\n✓')			
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." غادر$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'🚦┃تفو عليكم حغادر باي 💔🚶‍♂')
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.content_.ID == "MessagePhoto" and redis:get(max..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(max..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(max..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'💥┃تم تغيير صـورهہ‏‏ آلترحيب للبوت 🌿\n✓')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(max..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(max..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'💥┃ليس لدي صلاحيه تغيير الصوره \n🤖┃يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if msg.SudoUser and msg.text and redis:get(max..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_) then 
if not redis:get(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then return sendMsg(msg.chat_id_,msg.id_,"📛¦ عذرا غير مسموح باضافه كلمه الرد باكثر من 25 حرف \n❕") end
redis:setex(max..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:setex(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_,1400,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"📜¦ جيد , يمكنك الان ارسال جواب الرد المتعدد العام \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه,ملف ]] \n\n علما ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاضهار عدد الرسائل \n{النقاط} : لاضهار عدد النقاط \n{التعديل} : لاضهار عدد السحكات \n{البوت} : لاضهار اسم البوت\n{المطور} : لاضهار معرف المطور الاساسي\n\n〽️| يمكنك اضافه 10 ردود متعدد كحد اقصى  \n➼")
end
end



if  msg.SudoUser and msg.text and redis:get(max..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(max..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
local DelRd = redis:del(max..':ReplayRandom:'..msg.text) 
if DelRd == 0 then 
return sendMsg(msg.chat_id_,msg.id_,'🛑*¦* هذا الرد ليس مضاف في الردود العشوائيه 📛')
end
redis:del(max..':caption_replay:Random:'..msg.text) 
redis:srem(max..':KlmatRRandom:',msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'🛑*¦* تم حذف الرد بنجاح \n✓')
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(max..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(max..'replay1Random'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then 
return sendMsg(msg.chat_id_,msg.id_,"📛¦ عذرا غير مسموح باضافه كلمه الرد باكثر من 25 حرف \n❕")
end
redis:setex(max..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:setex(max..'replay1Random'..msg.chat_id_..msg.sender_user_id_,1400,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"📜¦ جيد , يمكنك الان ارسال جواب الرد المتعدد العام \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه,ملف ]] \n\n علما ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاضهار عدد الرسائل \n{النقاط} : لاضهار عدد النقاط \n{التعديل} : لاضهار عدد السحكات \n{البوت} : لاضهار اسم البوت\n{المطور} : لاضهار معرف المطور الاساسي\n\n〽️| يمكنك اضافه 10 ردود متعدد كحد اقصى  \n➼")
end
end

if redis:get(max..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(max..'replay:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(max..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"💥┃جيد , يمكنك الان ارسال جواب الرد \n💥┃[[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n✓")
end
end

if msg.text and redis:get(max..':DelrdRandom:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(max..':DelrdRandom:'..msg.chat_id_..msg.sender_user_id_)
local DelRd = redis:del(max..':ReplayRandom:'..msg.chat_id_..":"..msg.text) 
if DelRd == 0 then 
return sendMsg(msg.chat_id_,msg.id_,'🛑*¦* هذا الرد ليس مضاف في الردود العشوائيه 📛')
end
redis:del(max..':caption_replay:Random:'..msg.chat_id_..msg.text) 
redis:srem(max..':KlmatRRandom:'..msg.chat_id_,msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'🛑*¦* تم حذف الرد بنجاح \n✓')
end

if redis:get(max..'delrd:'..msg.sender_user_id_) then
redis:del(max..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(max..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(max..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(max..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(max..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(max..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(max..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'💬*┃*هذا الرد ليس مضاف في قائمه الردود 💥')
else
redis:hdel(max..'replay:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n  ✓ تم مسح الرد 💥 ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(max..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"💥*┃* عذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم\n")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"💥*┃* عذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت\n✓")      
end
end,nil)
end
return false
end
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغير صوره المجموعه ✓\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(max..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"💥┃ قام  ["..UserName.."]\n💥┃بتغير اسم المجموعه  ✋\n🗯┃الى "..Flter_Markdown(msg.content_.title_).." \n✓") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(max..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(max..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "💥┃اهلن بك عزيزي {الاسم}\n🎟┃معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين ♥\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n💥┃اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(max..'rulse:msg'..msg.chat_id_) or "💥┃مرحبأ عزيري القوانين كلاتي 👇🏻\n💥┃ممنوع نشر الروابط\n💥┃ممنوع التكلم او نشر صور اباحيه\n⚔┃ممنوع  اعاده توجيه\n💥┃ممنوع التكلم بلطائفه\n♥️┃الرجاء احترام المدراء والادمنيه 😅\n")
welcome = welcome:gsub("{القوانين}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "💥┃اهلن بك عزيزي {الاسم}\n🎟┃معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين ♥\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n💥┃اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(max..'rulse:msg'..msg.chat_id_) or "💥┃مرحبأ عزيري القوانين كلاتي 👇🏻\n💥┃ممنوع نشر الروابط\n💥┃ممنوع التكلم او نشر صور اباحيه\n⚔┃ممنوع  اعاده توجيه\n💥┃ممنوع التكلم بلطائفه\n♥️┃الرجاء احترام المدراء والادمنيه ??\n")
welcome = welcome:gsub("{القوانين}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

-------------------------------------------
if msg.adduser and redis:get(max..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(max..'welcome:get'..msg.chat_id_)
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not (msg.adduser or msg.joinuser or msg.deluser ) then -- Delete For User $ Vip

	if msg.text and (msg.text:match("ه‍") or msg.text:match("ی") or msg.text:match("ک")) and redis:get(max.."lock_pharsi"..msg.chat_id_) then
	Del_msg(msg.chat_id_,msg.id_,function(arg,data)
	print("\27[1;31m Msg Del becuse send lock_pharsi \27[0m")
	if data.ID == "Error" and data.code_ == 6 then
	return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
	end
	if redis:get(max..'lock_woring'..msg.chat_id_) then
	GetUserID(msg.sender_user_id_,function(arg,data)
	if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
	SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME.."\n📛¦ ممنوع ارسال الفارسيه  \n📛",12,utf8.len(USERNAME)) 
	end,nil)
	end
	end)
	end

	if msg.text and (msg.text:match("كسمك") or msg.text:match("قحب") or msg.text:match("عير") or msg.text:match("منيوك") or msg.text:match("منيو") or msg.text:match("كحب") or msg.text:match("سك") or msg.text:match("xn") or msg.text:match("xx") or msg.text:match("sex") or msg.text:match("نيج")  or msg.text:match("قحاب")  or msg.text:match("خوات القحبه")or msg.text:match("انيكم")or msg.text:match("كس")) and redis:get(max.."lock_mmno3"..msg.chat_id_) then
	Del_msg(msg.chat_id_,msg.id_,function(arg,data)
	print("\27[1;31m Msg Del becuse send mseeea \27[0m")
	if data.ID == "Error" and data.code_ == 6 then
	return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
	end
	if redis:get(max..'lock_woring'..msg.chat_id_) then
	GetUserID(msg.sender_user_id_,function(arg,data)
	if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
	SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME.."\n📛¦ ممنوع ارسال الكلمات المسيئه  \n📛",12,utf8.len(USERNAME)) 
	end,nil)
	end
	end)
	end
	
	
	-- if (msg.content_ and msg.content_.caption_ or msg.content_.caption_:match(false) ) then
		if msg.edited and redis:get(max.."lock_edit_media"..msg.chat_id_) and not (msg.content_.ID == "MessageText") then 
		  GetUserID(msg.sender_user_id_,function(arg,data)
		  msg = arg.msg 
		  local usersmnc = ""
		  local NameUser = Hyper_Link_Name(data)
		  if data.username_  then
		  uuseri = "\n🔬¦ معرفه : @["..(data.username_ or "None").."]" 
		  else
		  uuseri = ""
		  end
		  if (msg.content_.ID == "MessagePhoto") then
		  Rwers = "صوره"
		  Del_msg(msg.chat_id_,msg.id_)
		  elseif (msg.content_.ID == "MessageVoice") then
		  Rwers = "بصمه"
		  Del_msg(msg.chat_id_,msg.id_)
		  elseif (msg.content_.ID == "MessageAudio") then
		  Rwers = "صوت"
		  Del_msg(msg.chat_id_,msg.id_)
		  elseif (msg.content_.ID == "MessageVideo") then
		  Rwers = "فيديو"
		  Del_msg(msg.chat_id_,msg.id_)
		  elseif (msg.content_.ID == "MessageAnimation") then
		  Rwers = "متحركه"
		  Del_msg(msg.chat_id_,msg.id_)
		  end
		  local monsha = redis:smembers(max..':KARA_BOT:'..msg.chat_id_)
		  if #monsha ~= 0 then 
		  for k,v in pairs(monsha) do
		  local info = redis:hgetall(max..'username:'..v)
		  if info and info.username and info.username:match("@[%a%d_]+") then
		  usersmnc = usersmnc..info.username.." - "
		  end
		  sendMsg(v,0,"📇¦ هناك شخص قام بالتعديل \n👲🏼¦ الاسم : ⋙「 "..NameUser.." 」 "..(uuseri or "None").."\n🀄️¦ الايدي : `"..msg.sender_user_id_.."`\n📬¦ رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n🔌¦ نوع التعديل : "..(Rwers or "").."\n📱¦ المجموعة : "..Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')).."\n🔅¦ الرابط : "..redis:get(max..'linkGroup'..msg.chat_id_).." \n🚸" )
		  text = "📢¦ نداء لمنشئيين : 「[ > Click < ](tg://user?id="..v..")」 \n📇¦ هناك شخص قام بالتعديل"..(uuseri or "None").."\n👲🏼¦ الاسم : ⋙「 "..NameUser.." 」 \n🀄️¦ الايدي : `"..msg.sender_user_id_.."`\n📬¦ رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n🔌¦ نوع التعديل :  "..(Rwers or "").."\n🚸"
		  end
		  return send_msg(msg.chat_id_,text,msg.id_)
		  end
		  end,{msg=msg})
		end
	-- end
	

end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(max..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(max..'num_msg_max'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(max..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME.."\n💥┃قمـت بتگرآر آگثر مـن "..NUM_MSG_MAX.." رسـآلهہ‌‏ , لذآ تم تقييدگ مـن آلمـجمـوعهہ‌‏ ✓\n",12,USERCAR) 
return false
end)
end 
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'💥┃صلاحياته منشئ القروب\n🍃')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'💥┃مجرد عضو هنا\n🍃')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end
return sendMsg(chat,msg.id_,'📌┃الرتبة : مشرف 🍃\n💢┃والصلاحيات هي ⇓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n📝┃تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n📨┃حذف الرسائل ↞ ❪ '..delete..' ❫\n🚷┃حظر المستخدمين ↞ ❪ '..restrict..' ❫\n♻┃دعوة مستخدمين ↞ ❪ '..invite..' ❫\n🔘┃تثبيت الرسائل ↞ ❪ '..pin..' ❫\n💥┃اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n💠┃ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(max..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) and not redis:get(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع اعادة التوجيه  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(max..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(max..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا الانلاين مقفول  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(max..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(max..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(max..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃ممنوع ارسال الروابط  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃ممنوع ارسال روابط الويب   \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(max..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃ممنوع ارسال التاك  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(max..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃ممنوع ارسال المعرف   \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(max..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃ممنوع ارسال الماركدوان  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃ممنوع ارسال روابط الويب   \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageUnsupported" and redis:get(max..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الفيديو كام \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
elseif msg.edited and msg.content_.ID ~= "MessageText" and redis:get(max..'lock_edit'..msg.chat_id_) then -- قفل التعديل
  Del_msg(msg.chat_id_,msg.id_,function(arg,data) 
  print("\27[1;31m Msg Del becuse send Edit \27[0m")
  if data.ID == "Error" and data.code_ == 6 then
  return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
  end
  if redis:get(max..'lock_woring'..msg.chat_id_) then
  GetUserID(msg.sender_user_id_,function(arg,data)
  if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
  SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME.."\n📛¦ عذراً ممنوع التعديل تم المسح \n📛",12,utf8.len(USERNAME)) 
  end,nil)
  end
  end)
  return false
elseif redis:get(max..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الصور  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(max..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(max..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الفيديو  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(max..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(max..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الملفات  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(max..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الملصقات  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(max..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الصور المتحركه  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(max..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(max..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال جهات الاتصال  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(max..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الموقع  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(max..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال البصمات  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(max..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "┃┃عذرا ممنوع لعب الالعاب  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(max..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الصوت  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(max..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا الكيبورد مقفول  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(max..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال الروابط  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "💥┃عذرا ممنوع ارسال روابط الويب  \n💥"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(max..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'💥*┃* لا يمكنني مسح الرساله المخالفه .\n🎟*┃* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
local msgx = "💥┃عذرا ممنوع ارسال التاك او المعرف  \n💥"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┃العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)

if msg.text then
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg



if redis:get(max.."lock_RandomRdod"..msg.chat_id_) then 
local Replay = 0
Replay = redis:smembers(max..':ReplayRandom:'..msg.text) 
if #Replay ~= 0 then 
local Replay = Replay[math.random(#Replay)]
Replay = convert_Klmat(msg,data,Replay,true)
local CaptionFilter = Replay:gsub(":Text:",""):gsub(":Document:",""):gsub(":Voice:",""):gsub(":Photo:",""):gsub(":Animation:",""):gsub(":Audio:",""):gsub(":Sticker:",""):gsub(":Video:","")
Caption = redis:hget(max..':caption_replay:Random:'..msg.text,CaptionFilter)
Caption = convert_Klmat(msg,data,Caption)
if Replay:match(":Text:") then
return sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay:gsub(":Text:","")))
elseif Replay:match(":Document:") then 
return sendDocument(msg.chat_id_,msg.id_,Replay:gsub(":Document:",""),Caption)  
elseif Replay:match(":Photo:") then 
return sendPhoto(msg.chat_id_,msg.id_,Replay:gsub(":Photo:",""),Caption)  
elseif Replay:match(":Voice:") then 
return sendVoice(msg.chat_id_,msg.id_,Replay:gsub(":Voice:",""),Caption)
elseif Replay:match(":Animation:") then 
return sendAnimation(msg.chat_id_,msg.id_,Replay:gsub(":Animation:",""),Caption)  
elseif Replay:match(":Audio:") then 
return sendAudio(msg.chat_id_,msg.id_,Replay:gsub(":Audio:",""),"",Caption)  
elseif Replay:match(":Sticker:") then 
return sendSticker(msg.chat_id_,msg.id_,Replay:gsub(":Sticker:",""))  
elseif Replay:match(":Video:") then 
return sendVideo(msg.chat_id_,msg.id_,Replay:gsub(":Video:",""),Caption)
end
end


local Replay = 0
Replay = redis:smembers(max..':ReplayRandom:'..msg.chat_id_..":"..msg.text) 
if #Replay ~= 0 then 
local Replay = Replay[math.random(#Replay)]
Replay = convert_Klmat(msg,data,Replay,true)
local CaptionFilter = Replay:gsub(":Text:",""):gsub(":Document:",""):gsub(":Voice:",""):gsub(":Photo:",""):gsub(":Animation:",""):gsub(":Audio:",""):gsub(":Sticker:",""):gsub(":Video:","")
Caption = redis:hget(max..':caption_replay:Random:'..msg.chat_id_..msg.text,CaptionFilter)
Caption = convert_Klmat(msg,data,Caption)
if Replay:match(":Text:") then
return sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay:gsub(":Text:","")))
elseif Replay:match(":Document:") then 
return sendDocument(msg.chat_id_,msg.id_,Replay:gsub(":Document:",""),Caption)  
elseif Replay:match(":Photo:") then 
return sendPhoto(msg.chat_id_,msg.id_,Replay:gsub(":Photo:",""),Caption)  
elseif Replay:match(":Voice:") then 
return sendVoice(msg.chat_id_,msg.id_,Replay:gsub(":Voice:",""),Caption)
elseif Replay:match(":Animation:") then 
return sendAnimation(msg.chat_id_,msg.id_,Replay:gsub(":Animation:",""),Caption)  
elseif Replay:match(":Audio:") then 
return sendAudio(msg.chat_id_,msg.id_,Replay:gsub(":Audio:",""),"",Caption)  
elseif Replay:match(":Sticker:") then 
return sendSticker(msg.chat_id_,msg.id_,Replay:gsub(":Sticker:",""))  
elseif Replay:match(":Video:") then 
return sendVideo(msg.chat_id_,msg.id_,Replay:gsub(":Video:",""),Caption)
end
end

end

if redis:get(max..'replay'..msg.chat_id_) then
local Replay = false

Replay = redis:hget(max..'replay:all',msg.text)
if Replay then
Replay = convert_Klmat(msg,data,Replay,true)
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay))
return false
end

Replay = redis:hget(max..'replay:'..msg.chat_id_,msg.text)
if Replay then 
Replay = convert_Klmat(msg,data,Replay,true)
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay)) 
return false
end

Replay = redis:hget(max..'replay_photo:group:',msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
print(Caption)
sendPhoto(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(max..'replay_voice:group:',msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVoice(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(max..'replay_animation:group:',msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAnimation(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(max..'replay_audio:group:',msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAudio(msg.chat_id_,msg.id_,Replay,"",Caption)  
return false
end


Replay = redis:hget(max..'replay_files:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendDocument(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(max..'replay_files:group:',msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendDocument(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(max..'replay_sticker:group:',msg.text)
if Replay then 
sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_video:group:',msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVideo(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(max..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendPhoto(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(max..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVoice(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(max..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAnimation(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(max..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAudio(msg.chat_id_,msg.id_,Replay,"",Caption)  
return false
end

Replay = redis:hget(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(max..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVideo(msg.chat_id_,msg.id_,Replay,Caption)
return false
end
end

end,{msg=msg})


------------------------------{ Start Replay Send }------------------------

if not Replay then

--================================{{  Reply Bot  }} ===================================

local su = {
"نعم حبيبي المطور 🌝❤",
"هايروحي كٌْـْـًْْـٍْ☝ــًْوًٌْل😻❤️",
"ها يابــعد دگــات كِـུ֘͢ـ᷀͛❤️ـۢۢۢ͜͢͡ـلُـུ֤͋꩸֤ـֿ֤ࣵـبّـيَ🤤❤️",
"يابعد روح ["..Bot_Name.."] 😘❤️",
"هلا بمطوري العشق أمرني"}
local ss97 = {
"ها حياتي😻","عيونه 👀 وخشمه 👃🏻واذانه👂🏻",
"باقي ويتمدد 😎","ها حبي 😍","ها عمري 🌹","اجيت اجيت كافي لتصيح 🌚??",
"هياتني اجيت 🌚❤️","نعم حبي 😎","هوه غير يسكت عاد ها شتريد 😷",
"احجي بسرعه شتريد 😤","ها يا كلبي ❤️","هم صاحو عليه راح ابدل اسمي من وراكم 😡",
"لك فداك ["..Bot_Name.."] حبيبي انت اموووح 💋","دا اشرب جاي تعال غير وكت 😌","كول حبيبي أمرني 😍",
"احجي فضني شرايد ولا اصير ضريف ودكلي جرايد لو مجلات تره بايخه 😒😏",
"اشتعلو اهل ["..Bot_Name.."] شتريد 😠","بووووووووو 👻 ها ها فزيت شفتك شفتك لا تحلف 😂",
"طالع مموجود 😒","هااا شنوو اكو حاته بالكروب وصحت عليه  😍💕","انت مو قبل يومين غلطت عليه؟  😒",
"تروح فدوه الأسمي الوصخ شتري؟ مولبارحه رزلتك يوميه ازلك شبيك😑😹","ياعيون ["..Bot_Name.."] أمرني 😍",
"لك دبدل ملابسي اطلع برااااا 😵😡 ناس متستحي","سويت هواي شغلات سخيفه بحياتي بس عمري مصحت على واحد وكلتله انجب 😑",
"مشغول ويا ضلعتي  ☺️","مازا تريد منه 😌🍃"
}
local bs = {
"مابوس 🌚💔",
"اآآآم͠ــ.❤️😍ــو͠و͠و͠آ͠آ͠ح͠❤️عسسـل❤️",
"الوجه ميساعد 😐✋",
"ممممح😘ححح😍😍💋",
"مابوس واحد خايس مثل هاذا 😁",
"يععع تلعب نفسي 😷",
"بي/ها جرب اخاف 😢",
"استغفر الله فاسق 😒",
}
local ns = {
"🌹 هــلــℌelℓoووات🌹عمـ°🌺°ــري🙊😋",
"هلووات 😊🌹",
"هلا تاج راسي 🤷🏼‍♀️",
"كافي قبل شويه سلمت😌",
"هله بريحه هلي🤗",
"هلوات اذا عندك كروبات ضيفني🤷🏼‍♀️❤️",
"ۿۿـ℘ﹻۧـ๋͜ـﻶٌُوٰ୭ًٌَّّٳټٴ ͢⁽✨☻₎♤ عمري 🙊😍😘",
"هــلــℌelℓoووات عمـ°😻°ــري🙊😋",
": ٰٰهٌٰــٌـٓٓٓ:hand:ــٰـٰـٰ😍ــٰـٰـٰلـٰـٰوُٰـوُٰـوُات",
"هْـٌﮩٌﮧٌ﴿🙃﴾ﮩٌـ୭ٌ୭ـْلوُّات†😻☝️",
"كل الهلاهل 😻نورتنة 👐",
"هلوات عمري ☺😘",
}
local sh = {
"اهلا عزيزي المطور 😽❤️",
"هلوات نورت مطوري 😍",
"هلا سيدي المطور 😍 ",
"هلا تاج راسي المطور 😎",
"هلا عافيتي المطور مالي 😘",
"هلا بتاج راس ["..Bot_Name.."] 😘❤️",
}
local sss = {
"احســن مــن انتهــــہ شــلونـــك شــخــبـارك يـــول مۂــــشتـــاقـــلك شــو ماكـــو 😹🌚",
"تمام وانت يكيوت ؟ 💕",
"تمام ئنته شلونك 😁❤️",
"ع حطت ايدك ماكو تغيير شسوي يدنيه 🤷🏼‍♂️",
"لوني مثل لونك كافي تسئل😒",
"اني بالنسبة اليه دايح شوف بقيه الاعضااء 😂🖕",
}
local dr = {
"الله وياك والتكسي ع حساب المدير 😂😂 ماعليه اني 🙈",
"هاك الف شتري بيها لفتين فلافل 🌝💋",
"بعد وكت وين 🙄",
"منو زعلك حته تروح 😥",
"سلملي ع ئمك 🤷🏼‍♀️",
"تعال وين رايح عندي شغله وياك 🐣",
"• وين رايح خلينه متونسين 🙁💔",
"پہ‿؏ـد. وكت 😔💔",
"وين خلينه متونسين بيك 😂",
"تعال/ي نضحك عليك/ج الوصخ/ه 😋",
"يلا دي😆",
"وين رايح/ه للخاص تزحف/ين 🐛",
}
local nnn = {
"اسمي ["..Bot_Name.."] 😌",
"شتريد كل شويه كاتب بوت😒",
"اذا اصيح مره ثانيه بوت الزكك بالكاع 😠",
"انجب/ي انته/ي البوت😂",
}
local lovm = {
"اكرهك 😒👌🏿",
"منو لـ كلك احبك؟ 😒👌🏻",
"دي 😑👊🏾",
"اعشكك/ج مح 😍💋",
"اي احبك/ج 😍❤️",
"ماحبك/ج 😌🖖",
"امـــوت فيك ☹️",
"اذا كتلك/ج احبك/ج شراح تستفاد/ين 😕❤️",
"ولي ماحبك/ج 🙊💔",
}
local song = {
"عمي يبو البار 🤓☝🏿️ \nصبلي لبلبي ترى اني سكران 😌 \n وصاير عصبي 😠 \nانه وياج يم شامه 😉 \nوانه ويــــاج يم شامه  شد شد  👏🏿👏🏿 \nعدكم سطح وعدنه سطح 😁 \n نتغازل لحد الصبح 😉 \n انه وياج يم شامه 😍 \n وانه وياج فخريه وانه وياج حمديه 😂🖖🏿\n ",
"اي مو كدامك مغني قديم 😒🎋 هوه ﴿↜ انـِۨـۛـِۨـۛـِۨيـُِـٌِہۧۥۛ ֆᵛ͢ᵎᵖ ⌯﴾❥  ربي كامز و تكلي غنيلي 🙄😒🕷 آإرۈحُـ✯ـہ✟  😴أنــ💤ــااااام😴  اشرف تالي وكت يردوني اغني 😒☹️??","لا تظربني لا تظرب 💃💃 كسرت الخيزارانه💃?? صارلي سنه وست اشهر💃💃 من ظربتك وجعانه🤒😹",
"موجوع كلبي😔والتعب بية☹️من اباوع على روحي😢ينكسر كلبي عليه😭",
"ايامي وياها👫اتمنا انساها😔متندم اني حيل😞يم غيري هيه💃تضحك😂عليه│مقهور انام الليل😢كاعد امسح بل رسائل✉️وجان اشوف كل رسايلها📩وبجيت هوايه😭شفت احبك😍واني من دونك اموت😱وشفت واحد 🚶صار هسه وياية👬اني رايدها عمر عمر تعرفني كل زين🙈 وماردت لا مصلحة ولاغايه😕والله مافد يوم بايسها💋خاف تطلع🗣البوسه💋وتجيها حجايه😔️",
"│صوتي بعد مت سمعه✋يال رايح بلا رجعة🚶بزودك نزلت الدمعة ذاك اليوم☝️يال حبيتلك ثاني✌روح وياه وضل عاني😞يوم اسود علية اني🌚 ذاك اليوم☝️تباها بروحك واضحك😂لان بجيتلي عيني││ وافراح يابعد روحي😌خل الحركة تجويني😔🔥صوتي بعد متسمعة🗣✋",
}

local he = {"لوكي وزاحف من ساع زحفلي وحضرته 😒","خوش ولد و ورده مال الله 💋🙄","يلعب ع البنات 🙄","ولد زايعته الكاع 😶🙊","صاك يخبل ومعضل","محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️","اموت عليه 🌝","هوه غير الحب مال اني 🤓❤️","مو خوش ولد صراحه ☹️","ادبسز وميحترم البنات","فد واحد قذر 🙄😒","ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️","مو خوش ولد ??",
}
local she = {"الكبد مال اني هيه","ختولي حبها","خانتني ويه صديقي 😔","بس لو الكفها اله اعضها 💔","خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒","جذابه ومنافقه سوتلي مشكله ويه الحب مالتي","ئووووووووف اموت ع ربها","7ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفوون","صديقتي وختي وروحي وحياتي","فد وحده منحرفه 😥","ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐","ام سحوره سحرت اخويا وعلكته 6 سنوات ??","ماحبها 🙁","بله هاي جهره تسئل عليها ؟","بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼","ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹",
}
local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"💥| ما اكدر اقول اكثر من 500 حرف 🙌🏾")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),50)
if callback_Text and callback_Text == 'الاسم سبام 💥' then
return sendMsg(msg.chat_id_,msg.id_,"💥| للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif Text:match("^"..Bot_Name.." اتفل(.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'اوك سيدي 🌝🍃')
sendMsg(msg.chat_id_,msg.reply_id,'لك شنو هاذه ويهك ختفوووووووووو💦💦️️ بنص ويهك 😹') 
else
end
elseif Text:match("^"..Bot_Name.." رزله(.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'اوك سيدي ??🍃')
return sendMsg(msg.chat_id_,msg.reply_id,'تعال هيوو  😒 شو طالعه عينك ولسانك طويل سربوت  اشو تعال بله شنو هاذ ويهك هاذ 😳 قول بلعباس , 😅 لك #دي وتفو بعد لتندك بتاج راسك خوش حمبقلبي  👍🏿') 
end
elseif Text:match("^بوس(.*)$") then 
if msg.reply_id then 
return sendMsg(msg.chat_id_,msg.reply_id,bs[math.random(#bs)])
else
return sendMsg(msg.chat_id_,msg.id_,"📌 وينه بله سويله رد 🕵🏻")
end 
elseif msg.SudoUser and Text=="بوت" then 
return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
elseif not msg.SudoUser and Text=="هلو" then 
return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
elseif not msg.SudoUser and Text== "شلونكم" or Text== "شلونك" or Text== "شونك" or Text== "شونكم" or Text== "شلونكم" then
return sendMsg(msg.chat_id_,msg.id_,sss[math.random(#sss)])
elseif not msg.SudoUser and Text==" باي" or Text == "باي" then
return sendMsg(msg.chat_id_,msg.id_,dr[math.random(#dr)])
elseif not msg.SudoUser and Text==" بوت" or Text == "بوت" then
return sendMsg(msg.chat_id_,msg.id_,nnn[math.random(#nnn)])
elseif msg.SudoUser and Text== "احبك" then 
return sendMsg(msg.chat_id_,msg.id_,"اموت عليك حياتي  😍❤️")
elseif msg.SudoUser and Text== "تحبني" or Text=="حبك" then 
return sendMsg(msg.chat_id_,msg.id_,"اموت عليك حياتي  😍❤️")
elseif not msg.SudoUser and Text== "احبك" or Text=="حبك" then 
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif not msg.SudoUser and Text== "تحبني" then
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif Text== "غني" or Text=="غنيلي" then 
return sendMsg(msg.chat_id_,msg.id_,song[math.random(#song)])
elseif Text== "شنو رئيك بهاذا" or Text== "شنو رئيك بي" or Text== "شنو رئيك بهاذه" then 
return sendMsg(msg.chat_id_,msg.id_,he[math.random(#he)])
elseif Text== "شنو رئيك بهاي" or Text=="شنو رئيك بيه" or Text== "شنو رئيك بهاذش" then 
return sendMsg(msg.chat_id_,msg.id_,she[math.random(#she)])
elseif Text=="اتفل" or Text=="تفل" then
if msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,'ختفوووووووووو💦💦️️')
else 
return sendMsg(msg.chat_id_,msg.id_,"📌 انجب ما اتفل عيب 😼🙌🏿") 
end
elseif Text== "رفع اثول"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم رفع العضو اثول الگروب🤪بنجاح✔️\n💥┃تمت إضافته إلى قائمه الثولان😹\n✓️")
elseif Text== "تنزيل اثول"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم تنزيل العضو من ثولان القروب✔️\n💥┃تمت الزاله من قامة الثولان😹\n✓️")
elseif Text== "رفع جلب"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم رفع المتهم إلى جلب 🐶بنجاح✔️\n💥┃تمت إضافته إلى قائمه الجلاب😹\n✓️")
elseif Text== "رفع مطي"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم رفع المتهم إلى مطي 🦓بنجاح✔️\n💥┃تمت إضافته إلى قائمه المطايه😹\n✓️")
elseif Text== "تنزيل مطي"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم تنزيل المتهم مطي بنجاح✔️\n💥┃تمت ازالته من قائمه المطايه😹\n✓️")
elseif Text== "تنزيل جلب"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي \n💥┃تم تنزيل المتهم جلب 🐶بنجاح✔️\n💥┃تمت إزالته من قائمه الجلاب😹\n✓️")
elseif Text== "تنزيل زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم تنزيل المتهم زاحف بنجاح✔️\n💥┃تمت ازالته من قائمه الزواحف😹\n✓️")
elseif Text== "رفع صخل"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم رفع المتهم صخل 😹بنجاح✔️\n💥┃الان اصبح صخل القروب 🐐\n✓️")
elseif Text== "تنزيل صخل"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم تنزيل المتهم صخل😹بنجاح✔️\n💥┃تمت ٳزالته من قائمة الصخوله🐐\n✓️")
elseif Text== "رفع بكلبي"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم رفع العضو داخل كلبك✔️\n💥┃تمت ترقيته بنجاح 😻??👋🏻\n✓️")
elseif Text== "تنزيل من كلبي"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم تنزيل من داخل قلبك✔️\n💥┃تمت ازالته من قائمه القلوب 😹💔\n✓️")
elseif Text== "رفع تاج"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهـلا عزيزي\n💥┃تم رفع صديقك تـ👑ـاج بنجاح ✔️ \n💥┃اصبح خط احمر ❗️ \n✓️")
elseif Text== "تنزيل تاج"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهـلا عزيزي\n💥┃تم تنزيل العضو المهتلف\n💥┃من قائمة ألتـ👑ـاج بنجاح ✔️😹💔\n✓️")
elseif Text== "رفع مرتي"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم رفع العضو مرتك بنجاح✔️\nالآن يمكنكم أخذ راحتكم🤤😉\n✓️")
elseif Text== "تنزيل مرتي"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم تنزيل الجكمه مرتك بنجاح✔️\nالآن انتم مفترقان☹️💔\n✓️")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم زواجكم الاثنين بنجاح✔️\n💥┃الآن يمكنكم أخذ راحتكم🤤😉\n✓️")
elseif Text== "طلاك"  then return sendMsg(msg.chat_id_,msg.id_,"💥┃اهــلا عزيزي\n💥┃تم طلاك العضو بنجاح✔️\n💥┃الآن هو مطلك امشي طلعبرا 😹💔\n✓️")
elseif Text== "اوامر اللتحشيش"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏┄─┅══┅─┄\n🙋🏽‍♂┃مرحبآ عزيزي\n💯┃إليـك اوامر التحشيش كـ التالي\n┄─┅═ـ═┅─┄\n🤴┃رفع «» تنزيل ❬ تـــاج ❭\n👰┃رفع «» تنزيل ❬ مرتي ❭\n🤪┃رفع «» تنزيل ❬ اثـول ❭\n🐕┃رفع «» تنزيل ❬ جلـب ❭\n🦓┃رفع «» تنزيل ❬ مطـي ❭\n🐐┃رفع «» تنزيل ❬ صخـل ❭\n🦎┃رفع «» تنزيل ❬ زاحف ❭\n❤️┃رفع «» ❬ بكلبي ❭ تنزيل «» ❬ من كلبي❭\n🎈┃❬ طلاك ❭ «» ❬ زواج ❭\n┄─┅═ـ═┅─┄")

elseif Text== "اقرالي دعاء" then 
return sendMsg(msg.chat_id_,msg.id_,"اللهم عذب المدرسين 😢 منهم الاحياء والاموات 😭💥 اللهم عذب ام الانكليزي 😭💔 وكهربها بلتيار الرئيسي 😇 اللهم عذب ام الرياضيات وحولها الى غساله بطانيات 🙊 اللهم عذب ام الاسلاميه واجعلها بائعة الشاميه 😭🍃 اللهم عذب ام العربي وحولها الى بائعه البلبي اللهم عذب ام الجغرافيه واجعلها كلدجاجه الحافية اللهم عذب ام التاريخ وزحلقها بقشره من البطيخ وارسلها الى المريخ اللهم عذب ام الاحياء واجعلها كل مومياء اللهم عذب المعاون اقتله بلمدرسه بهاون 😂😂😂")
elseif Text== "ايديي" or Text=="ايدي 💥" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🧟‍♂┃آضـغط على آلآيدي ليتم آلنسـخ\n\n "..USERNAME.." ~⪼ ( "..data.id_.." )",37,USERCAR)  
return false
end)
elseif Text=="اريد رابط الحذف" or Text=="اريد رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
return sendMsg(msg.chat_id_,msg.id_,[[
💥*┃* رابط حذف حـساب التيليگرام ↯
💥┃لتتندم فڪر قبل ڪلشي  
💥┃[اضغط هنا لـحـذف الـحـسـاب](https://telegram.org/deactivate)
👨🏽‍⚖️┃بالتـوفيـق عزيزي ...
🎁┃[اضغط هنا لديك فاجئه](https://t.m/op70)
]] )
--=====================================
elseif Text== "انجب" or Text== "نجب" or Text=="جب" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"حاضر مو تدلل حضره المطور  😇 ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"تقول جب لانك منشئ وحركات صح؟ اقول اسكت بس😡❌")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"عشانك مدير تغلط؟(  العرب أخوه ) بدون جب لا تنزل😒")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"رفعناك ادمن صرت قوي؟ لو  نرفعك مدير شتسوي يبعدي🤜🏻👀")
else 
return sendMsg(msg.chat_id_,msg.id_,"جب انت لا تقول جب😏")
end 
end



end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------
if not redis:get('kar') then
redis:setex('kar',86400,true) 
json_data = '{"BotID": '..max..',"UserBot": "'..Bot_User..'","Groups" : {'
local All_Groups_ID = redis:smembers(max..'group:ids')
for key,GroupS in pairs(All_Groups_ID) do
local NameGroup = (redis:get(max..'group:name'..GroupS) or '')
NameGroup = NameGroup:gsub('"','')
NameGroup = NameGroup:gsub([[\]],'')
if key == 1 then
json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
else
json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
end
local admins = redis:smembers(max..'admins:'..GroupS)
if #admins ~= 0 then
json_data =  json_data..',"Admins" : {'
for key,value in pairs(admins) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end

local creators = redis:smembers(max..':MONSHA_BOT:'..GroupS)
if #creators ~= 0 then
json_data =  json_data..',"Creator" : {'
for key,value in pairs(creators) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end

local malk = redis:smembers(max..':MALK_BOT:'..GroupS)
if #malk ~= 0 then
json_data =  json_data..',"malk" : {'
for key,value in pairs(malk) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end

local creator = redis:smembers(max..':KARA_BOT:'..GroupS)
if #creator ~= 0 then
json_data =  json_data..',"Kara" : {'
for key,value in pairs(creator) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end

local owner = redis:smembers(max..'owners:'..GroupS)
if #owner ~= 0 then
json_data =  json_data..',"Owner" : {'
for key,value in pairs(owner) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end
json_data =  json_data.."}"
end
local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
Save_Data:write(json_data..'}}')
Save_Data:close()
sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","💥| ملف نسخه تلقائيه\n💥|  اليك مجموعاتك » { "..#All_Groups_ID.." }\n💥| للبوت » "..Bot_User.."\n💥| التاريخ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
end
if redis:get(max..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'🕵┃انتهى الاشتراك في احد المجموعات ✋🏿\n👨🏾‍🔧┃المجموعه : '..FlterName(redis:get(max..'group:name'..msg.chat_id_))..'🍃\n💂🏻‍♀️┃ايدي : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'🕵🏼️‍♀️┃انتهى الاشتراك البوت✋🏿\n💂🏻‍♀️┃سوف اغادر المجموعه فرصه سعيده 👋🏿\n👨🏾‍🔧┃او راسل المطور للتجديد '..SUDO_USER..' 🍃')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(max..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'🕵🏼️‍♀️┃باقي يوم واحد وينتهي الاشتراك ✋🏿\n👨🏾‍🔧┃راسل المطور للتجديد '..SUDO_USER..'\n💥')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------


end 


return {
max = {
"^(تقييد)$",
"^(تقييد) (%d+)$",
"^(تقييد) (@[%a%d_]+)$",
"^(فك التقييد)$",
"^(فك التقييد) (%d+)$",
"^(فك التقييد) (@[%a%d_]+)$",
"^(فك تقييد)$",
"^(فك تقييد) (%d+)$",
"^(فك تقييد) (@[%a%d_]+)$",
"^(ضع شرط التفعيل) (%d+)$",
"^(التفاعل)$",
"^(التفاعل) (@[%a%d_]+)$",
"^([iI][dD])$",
"^(تفعيل الايدي بالصوره)$",
"^(تعطيل الايدي بالصوره)$",
"^(تعطيل الرفع)$",
"^(تفعيل الرفع)$",
"^(قفل الدخول بالرابط)$",
"^(فتح الدخول بالرابط)$", 
"^(ايدي)$",
"^(ايدي) (@[%a%d_]+)$",
"^(كشف)$",
"^(كشف) (%d+)$",
"^(كشف) (@[%a%d_]+)$",
'^(رفع مميز)$',
'^(رفع مميز) (@[%a%d_]+)$',
'^(رفع مميز) (%d+)$',
'^(تنزيل مميز)$',
'^(تنزيل مميز) (@[%a%d_]+)$',
'^(تنزيل مميز) (%d+)$',
'^(رفع ادمن)$',
'^(رفع ادمن) (@[%a%d_]+)$',
'^(رفع ادمن) (%d+)$',
'^(تنزيل ادمن)$',
'^(تنزيل ادمن) (@[%a%d_]+)$',
'^(تنزيل ادمن) (%d+)$', 
'^(رفع مطي)$',
'^(تنزيل مطي)$', 
'^(رفع زاحف)$',
'^(تنزيل زاحف)$', 
'^(رفع المدير)$',
'^(رفع مدير)$', 
'^(رفع مدير) (@[%a%d_]+)$',
'^(رفع المدير) (@[%a%d_]+)$',
'^(رفع المدير) (%d+)$',
'^(رفع مدير) (%d+)$',
'^(رفع منشى اساسي)$',
'^(رفع منشئ اساسي)$',
'^(رفع منشئ اساسي) (@[%a%d_]+)$',
'^(رفع منشى اساسي) (@[%a%d_]+)$',
'^(تنزيل منشئ اساسي)$',
'^(تنزيل منشئ الاساسي)$',
'^(تنزيل منشئ اساسي) (%d+)$',
'^(تنزيل منشئ الاساسي) (%d+)$',
'^(تنزيل منشئ الاساسي) (@[%a%d_]+)$',
'^(تنزيل منشئ اساسي) (@[%a%d_]+)$',
'^(رفع منشى)$',
'^(رفع منشئ)$',
'^(رفع منشئ) (@[%a%d_]+)$',
'^(رفع منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ)$',
'^(تنزيل منشى)$',
'^(تنزيل منشئ) (%d+)$',
'^(تنزيل منشى) (%d+)$',
'^(تنزيل منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ) (@[%a%d_]+)$',
'^(تنزيل المدير)$',
'^(تنزيل مدير)$',
'^(تنزيل مدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (%d+)$',
'^(تنزيل مدير) (%d+)$',
 '^(صلاحياته)$',
 '^(صلاحياتي)$',
'^(صلاحياته) (@[%a%d_]+)$',
'^(قفل) (.+)$',
'^(فتح) (.+)$',
'^(تفعيل)$',
'^(تفعيل) (.+)$',
'^(تعطيل)$',
'^(تعطيل) (.+)$',
'^(ضع تكرار) (%d+)$',
"^(مسح)$",
"^(مسح) (.+)$",
'^(منع) (.+)$',
'^(الغاء منع) (.+)$',
"^(حظر عام)$",
"^(حظر عام) (@[%a%d_]+)$",
"^(حظر عام) (%d+)$",
"^(الغاء العام)$",
"^(الغاء العام) (@[%a%d_]+)$",
"^(الغاء العام) (%d+)$",
"^(الغاء عام)$",
"^(الغاء عام) (@[%a%d_]+)$",
"^(الغاء عام) (%d+)$",
"^(حظر)$",
"^(حظر) (@[%a%d_]+)$",
"^(حظر) (%d+)$",
"^(الغاء الحظر)$", 
"^(الغاء الحظر) (@[%a%d_]+)$",
"^(الغاء الحظر) (%d+)$",
"^(الغاء حظر)$", 
"^(الغاء حظر) (@[%a%d_]+)$",
"^(الغاء حظر) (%d+)$",
"^(طرد)$",
"^(طرد) (@[%a%d_]+)$",
"^(طرد) (%d+)$",
"^(كتم)$",
"^(كتم) (@[%a%d_]+)$",
"^(كتم) (%d+)$",
"^(الغاء الكتم)$",
"^(الغاء الكتم) (@[%a%d_]+)$",
"^(الغاء الكتم) (%d+)$",
"^(الغاء كتم)$",
"^(الغاء كتم) (@[%a%d_]+)$",
"^(الغاء كتم) (%d+)$",
"^(كتم بالوقت) (@[%a%d_]+)$",
"^(كتم بالوقت) (%d+)$",
"^(كتم بالوقت)$",
"^(كتم بالوقت) (@[%a%d_]+)$",
"^(كتم بالوقت) (%d+)$",
"^(الغاء الكتم بالوقت) (@[%a%d_]+)$",
"^(الغاء الكتم بالوقت) (%d+)$",
"^(الغاء كتم بالوقت)$",
"^(الغاء كتم بالوقت) (@[%a%d_]+)$",
"^(الغاء كتم بالوقت) (%d+)$",
"^(رفع مطور)$",
"^(رفع مطور) (@[%a%d_]+)$",
"^(رفع مطور) (%d+)$",
"^(تنزيل مطور)$",
"^(تنزيل مطور) (%d+)$",
"^(تنزيل مطور) (@[%a%d_]+)$",
"^(تعطيل) (-%d+)$",
"^(الاشتراك) ([123])$",
"^(الاشتراك)$",
"^(قفل التعديل)$",
'^(تنزيل الكل) (@[%a%d_]+)$',
'^(تنزيل الكل) (%d+)$',
"^(تنزيل الكل)$",
"^(شحن) (%d+)$",
"^(المجموعه)$",
"^(كشف البوت)$",
"^(انشاء رابط)$",
"^(ضع الرابط)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الغاء تثبيت)$",
"^(المالك)$",
"^(رابط)$",
"^(الرابط)$",
"^(ضع رابط)$",
"^(رابط خاص)$",
"^(الرابط خاص)$",
"^(القوانين)$",
"^(ضع القوانين)$",
"^(ضع قوانين)$",
"^(ضع تكرار)$",
"^(ضع التكرار)$",
"^(الادمنيه)$",
"^(تاك للكل)$",
"^(تاك للسرسريه)$",
"^(تاك)$",
"^(قائمه المنع)$",
"^(المدراء)$",
"^(المميزين)$",
"^(المكتومين)$",
"^(ضع الترحيب)$",
"^(الترحيب)$",
"^(المنشى الاساسي)$",
"^(المنشئ الاساسي)$",
"^(المحظورين)$",
"^(ضع اسم)$",
"^(ضع صوره)$",
"^(ضع وصف)$",
"^(طرد البوتات)$",
"^(كشف البوتات)$",
"^(طرد المحذوفين)$",
"^(قفل الفارسيه)$",
"^(فتح الفارسيه)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(احصائياتي)$",
"^(معلوماتي)$",
"^(مسح معلوماتي)$",
"^(موقعي)$",
"^(رفع الادمنيه)$",
"^(صوره الترحيب)$",
"^(ضع كليشه المطور)$",
"^(المطور)$",
"^(فتح الفشار)$",
"^(قفل الفشار)$",

"^(فتح تعديل الميديا)$",
"^(قفل تعديل الميديا)$",

"^(شرط التفعيل)$",
"^(قائمه المجموعات)$",
"^(المجموعات)$",
"^(المجموعات 🌋)$",
"^(المشتركين)$",
"^(المشتركين Ⓜ)$",
"^(اذاعه)$",
"^(اذاعه عام)$",
"^(اذاعه خاص)$",
"^(اذاعه عام بالتوجيه)$",
"^(اذاعه عام بالتوجيه 📣)$", 
"^(اذاعه خاص 🗣)$", 
"^(اذاعه عام 📢)$", 
"^(اذاعه 🗣)$", 
"^(قائمه العام)$",
"^(قائمه العام 📜)$",
"^(المطورين)$",
"^(المطورين 🔥)$",
"^(تيست)$",
"^(test)$",
"^(ايديي💥)$",
"^(قناة السورس 💥)$",
"^(الاحصائيات)$",
"^(الاحصائيات 💥)$",
"^(اضف رد عام)$",
"^(اضف رد عام ➕)$",
"^(مسح الردود)$",
"^(مسح الردود العامه)$",
"^(ضع اسم للبوت)$",
"^(مسح الصوره)$",
"^(مسح رد)$",
"^(الردود)$",
"^(الردود العامه)$",
"^(الردود العامه 🗨)$",
"^(اضف رد)$",
"^(/UpdateSource)$",
"^(تحديث السورس 🔂)$",
"^(تحديث السورس)$",
"^(تنظيف المجموعات)$",
"^(تنظيف المشتركين)$",
"^(تنظيف المجموعات 🗑)$",
"^(تنظيف المشتركين 🗑)$",
"^(رتبتي)$",
"^(ضع اسم للبوت ©)$",
"^(ضع صوره للترحيب 🌄)$",
"^(ضع صوره للترحيب)$",
"^(الحمايه)$",
"^(الاعدادات)$",
"^(الوسائط)$",
"^(الغاء الامر ✖️)$",
"^(الرتبه)$",
"^(الغاء)$",
"^(سحكاتي)$",
"^(اسمي)$",
"^(التاريخ)$",
"^(/[Ss]tore)$",
"^(اصدار السورس)$",
"^(الاصدار)$",
"^(server)$",
"^(السيرفر)$",
"^(فحص البوت)$", 
"^(نسخه احتياطيه للمجموعات)$",
"^(رفع نسخه الاحتياطيه)$", 
"^(تفعيل الاشتراك الاجباري)$", 
"^(تعطيل الاشتراك الاجباري)$", 
"^(تغيير الاشتراك الاجباري)$", 
"^(الاشتراك الاجباري)$", 
"^(تفعيل الاشتراك الاجباري ☑)$", 
"^(تعطيل الاشتراك الاجباري ♻️)$", 
"^(تغيير الاشتراك الاجباري 🔁)$", 
"^(الاشتراك الاجباري ⚠️)$", 
"^(احظرني)$", 
"^(اطردني)$", 
"^(جهاتي)$", 









"^(السورس)$",
"^(سورس)$",
"^(م المطور)$", 
"^(اوامر الرد)$",
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$",
"^(م4)$",
"^(م5)$",
"^(م6)$",
"^(م7)$",
 
 
 },
 imax = imax,
 dmax = dmax,
 }
