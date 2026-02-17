


local a,b,c=...

local d=game:GetService"CoreGui"
local e=game:GetService"RunService"
local f=game:GetService"Players"
local g=workspace local h=

f.LocalPlayer
local i=g.CurrentCamera
local j=i.ViewportSize

local k=Instance.new("Folder",(gethui and gethui())or d)

local l=a or{
default="OriginalKirk.jpg",
survivor={},
killer={},
}

local m=b or{}
local n=c or{}

local o=Instance.new"Model"
o.Name="Skeleton"
o.WorldPivot=CFrame.new(-3,2.5,71.3599701,1,0,0,0,1,0,0,0,1)

local p=Instance.new"Part"
p.Name="Head"
p.Anchored=true
p.BottomSurface=Enum.SurfaceType.Smooth
p.BrickColor=BrickColor.Black()
p.CFrame=CFrame.new(-3,4.5,71.3599701,1,0,0,0,1,0,0,0,1)
p.Color=Color3.fromRGB(27,42,53)
p.Size=Vector3.new(1.7,0.851,0.851)
p.TopSurface=Enum.SurfaceType.Smooth

local q=Instance.new"SpecialMesh"
q.Name="Mesh"
q.MeshType=Enum.MeshType.FileMesh
q.MeshId="rbxassetid://36869983"
q.TextureId="rbxassetid://36869975"
q.Scale=Vector3.new(0.851,0.851,0.851)
q.Parent=p

p.Parent=o

local r=Instance.new"Part"
r.Name="Torso"
r.Anchored=true
r.BottomSurface=Enum.SurfaceType.Smooth
r.BrickColor=BrickColor.Black()
r.CFrame=CFrame.new(-3,3,71.3599701,1,0,0,0,1,0,0,0,1)
r.Color=Color3.fromRGB(27,42,53)
r.Size=Vector3.new(2,2,1)
r.TopSurface=Enum.SurfaceType.Smooth

local s=Instance.new"SpecialMesh"
s.Name="Mesh"
s.MeshType=Enum.MeshType.FileMesh
s.MeshId="rbxassetid://36780113"
s.TextureId="rbxassetid://36780292"
s.Parent=r

r.Parent=o

local t=Instance.new"Part"
t.Name="Right Arm"
t.Anchored=true
t.BottomSurface=Enum.SurfaceType.Smooth
t.BrickColor=BrickColor.Black()
t.CFrame=CFrame.new(-1.5,3,71.3599701,1,0,0,0,1,0,0,0,1)
t.Color=Color3.fromRGB(27,42,53)
t.Size=Vector3.new(1,2,1)
t.TopSurface=Enum.SurfaceType.Smooth

local u=Instance.new"SpecialMesh"
u.Name="Mesh"
u.MeshType=Enum.MeshType.FileMesh
u.MeshId="rbxassetid://36780156"
u.TextureId="rbxassetid://36780292"
u.Parent=t

t.Parent=o

local v=Instance.new"Part"
v.Name="Left Arm"
v.Anchored=true
v.BottomSurface=Enum.SurfaceType.Smooth
v.BrickColor=BrickColor.Black()
v.CFrame=CFrame.new(-4.5,3,71.3599701,1,0,0,0,1,0,0,0,1)
v.Color=Color3.fromRGB(27,42,53)
v.Size=Vector3.new(1,2,1)
v.TopSurface=Enum.SurfaceType.Smooth

local w=Instance.new"SpecialMesh"
w.Name="Mesh"
w.MeshType=Enum.MeshType.FileMesh
w.MeshId="rbxassetid://36780032"
w.TextureId="rbxassetid://36780292"
w.Parent=v

v.Parent=o

local x=Instance.new"Part"
x.Name="Left Leg"
x.Anchored=true
x.BottomSurface=Enum.SurfaceType.Smooth
x.BrickColor=BrickColor.Black()
x.CFrame=CFrame.new(-3.5,1,71.3599701,1,0,0,0,1,0,0,0,1)
x.Color=Color3.fromRGB(27,42,53)
x.Size=Vector3.new(1,2,1)
x.TopSurface=Enum.SurfaceType.Smooth

local y=Instance.new"SpecialMesh"
y.Name="Mesh"
y.MeshType=Enum.MeshType.FileMesh
y.MeshId="rbxassetid://36780079"
y.TextureId="rbxassetid://36780292"
y.Parent=x

x.Parent=o

local z=Instance.new"Part"
z.Name="Right Leg"
z.Anchored=true
z.BottomSurface=Enum.SurfaceType.Smooth
z.BrickColor=BrickColor.Black()
z.CFrame=CFrame.new(-2.5,1,71.3599701,1,0,0,0,1,0,0,0,1)
z.Color=Color3.fromRGB(27,42,53)
z.Size=Vector3.new(1,2,1)
z.TopSurface=Enum.SurfaceType.Smooth

local A=Instance.new"SpecialMesh"
A.Name="Mesh"
A.MeshType=Enum.MeshType.FileMesh
A.MeshId="rbxassetid://36780195"
A.TextureId="rbxassetid://36780292"
A.Parent=z

z.Parent=o
o.Parent=k

local B=math.floor
local C=math.round
local D=math.sin
local E=math.cos
local F=table.clear
local G=table.unpack
local H=table.find
local I=table.create
local J=CFrame.fromMatrix

local K=i.WorldToViewportPoint
local L=g.IsA
local M=g.GetPivot
local N=g.FindFirstChild
local O=g.FindFirstChildOfClass
local P=g.GetChildren
local Q=CFrame.identity.PointToObjectSpace
local R=Color3.new().Lerp
local S=Vector2.zero.Min
local T=Vector2.zero.Max
local U=Vector2.zero.Lerp
local V=Vector3.zero.Min
local W=Vector3.zero.Max

local X=Vector2.new(5,0)
local Y=Vector2.new(3,0)
local Z=Vector2.new(0,1)
local _=Vector2.new(0,2)
local aa=Vector2.new(0,2)
local ab={
Vector3.new(-1,-1,-1),
Vector3.new(-1,1,-1),
Vector3.new(-1,1,1),
Vector3.new(-1,-1,1),
Vector3.new(1,-1,-1),
Vector3.new(1,1,-1),
Vector3.new(1,1,1),
Vector3.new(1,-1,1),
}

local ac=k:WaitForChild"Skeleton"

local ad=Instance.new"ScreenGui"
ad.Name="SkeletonOverlay"
ad.IgnoreGuiInset=true
ad.DisplayOrder=200
ad.ResetOnSpawn=false
ad.Parent=(gethui and gethui())or d

local ae=Instance.new"ViewportFrame"
ae.Size=UDim2.fromScale(1,1)
ae.BackgroundTransparency=1
ae.Ambient=Color3.new(1,1,1)
ae.LightColor=Color3.new(1,1,1)
ae.Parent=ad

local af=Instance.new"Camera"
af.Parent=ae
ae.CurrentCamera=af

local ag=Instance.new"WorldModel"
ag.Parent=ae

local ah=Instance.new"ScreenGui"
ah.Name="KirkOverlay"
ah.IgnoreGuiInset=true
ah.DisplayOrder=201
ah.ResetOnSpawn=false
ah.Parent=(gethui and gethui())or d

local ai=Instance.new"ScreenGui"
ai.Name="IconOverlay"
ai.IgnoreGuiInset=true
ai.DisplayOrder=202
ai.ResetOnSpawn=false
ai.Parent=(gethui and gethui())or d

local function IsBodyPart(aj)
return aj=="Head"or aj:find"Torso"or aj:find"Leg"or aj:find"Arm"
end

local function GetBoundingBox(aj)
local ak,al
for am=1,#aj do
local an=aj[am]
local ao,ap=an.CFrame,an.Size

ak=V(ak or ao.Position,(ao-ap*0.5).Position)
al=W(al or ao.Position,(ao+ap*0.5).Position)
end

local am=(ak+al)*0.5
local an=Vector3.new(am.X,am.Y,al.Z)
return CFrame.new(am,an),al-ak
end

local function WorldToScreen(aj)
local ak,al=K(i,aj)
return Vector2.new(ak.X,ak.Y),al,ak.Z
end

local function CalculateCorners(aj,ak)
local al=I(#ab)
for am=1,#ab do
al[am]=WorldToScreen((aj+ak*0.5*ab[am]).Position)
end

local am=S(j,G(al))
local an=T(Vector2.zero,G(al))
return{
Corners=al,
TopLeft=Vector2.new(B(am.X),B(am.Y)),
TopRight=Vector2.new(B(an.X),B(am.Y)),
BottomLeft=Vector2.new(B(am.X),B(an.Y)),
BottomRight=Vector2.new(B(an.X),B(an.Y)),
}
end

local function RotateVector(aj,ak)
local al,am=aj.X,aj.Y
local an,ao=E(ak),D(ak)
return Vector2.new(al*an-am*ao,al*ao+am*an)
end

local function ParseColor(aj,ak,al)
if ak=="Team Color"or(aj.Interface.sharedSettings.useTeamColor and not al)then
return aj.Interface.GetTeamColor(aj.Player)or Color3.new(1,1,1)
end
return ak
end

local aj={}
aj.__index=aj

function aj.New(ak,al)
local am=setmetatable({},aj)
am.Player=assert(ak,"Missing argument #1 (Player expected)")
am.Interface=assert(al,"Missing argument #2 (table expected)")
am:Construct()
return am
end

function aj._Create(ak,al,am)
local an=Drawing.new(al)
for ao,ap in next,am do
pcall(function()
an[ao]=ap
end)
end
ak.Bin[#ak.Bin+1]=an
return an
end

function aj.Construct(ak)
ak.CharCache={}
ak.ChildCount=0
ak.Bin={}
ak.Drawings={
Box3d={
{
ak:_Create("Line",{Thickness=1,Visible=false}),
ak:_Create("Line",{Thickness=1,Visible=false}),
ak:_Create("Line",{Thickness=1,Visible=false}),
},
{
ak:_Create("Line",{Thickness=1,Visible=false}),
ak:_Create("Line",{Thickness=1,Visible=false}),
ak:_Create("Line",{Thickness=1,Visible=false}),
},
{
ak:_Create("Line",{Thickness=1,Visible=false}),
ak:_Create("Line",{Thickness=1,Visible=false}),
ak:_Create("Line",{Thickness=1,Visible=false}),
},
{
ak:_Create("Line",{Thickness=1,Visible=false}),
ak:_Create("Line",{Thickness=1,Visible=false}),
ak:_Create("Line",{Thickness=1,Visible=false}),
},
},
Visible={
TracerOutline=ak:_Create("Line",{Thickness=3,Visible=false}),
Tracer=ak:_Create("Line",{Thickness=1,Visible=false}),
BoxFill=ak:_Create("Square",{Filled=true,Visible=false}),
BoxOutline=ak:_Create("Square",{Thickness=3,Visible=false}),
Box=ak:_Create("Square",{Thickness=1,Visible=false}),
HealthBarOutline=ak:_Create("Line",{Thickness=3,Visible=false}),
HealthBar=ak:_Create("Line",{Thickness=1,Visible=false}),
HealthText=ak:_Create("Text",{Center=true,Visible=false}),
Name=ak:_Create("Text",{Text=ak.Player.DisplayName,Center=true,Visible=false}),
Distance=ak:_Create("Text",{Center=true,Visible=false}),
Weapon=ak:_Create("Text",{Center=true,Visible=false}),
},
Hidden={
ArrowOutline=ak:_Create("Triangle",{Thickness=3,Visible=false}),
Arrow=ak:_Create("Triangle",{Filled=true,Visible=false}),
},
}

ak.KirkImage=Instance.new"ImageLabel"
ak.KirkImage.Name="KirkImage_"..ak.Player.Name
ak.KirkImage.BackgroundTransparency=1
ak.KirkImage.BorderSizePixel=0
ak.KirkImage.ScaleType=Enum.ScaleType.Stretch
ak.KirkImage.Visible=false
ak.KirkImage.Parent=ah

ak.IconBillboard=Instance.new"BillboardGui"
ak.IconBillboard.Name="IconESP_"..ak.Player.Name
ak.IconBillboard.Adornee=nil
ak.IconBillboard.AlwaysOnTop=true
ak.IconBillboard.Size=UDim2.fromOffset(250,60)
ak.IconBillboard.StudsOffset=Vector3.new(0,4,0)
ak.IconBillboard.ResetOnSpawn=false
ak.IconBillboard.Parent=ai

local al=Instance.new"Frame"
al.Name="Container"
al.Size=UDim2.fromScale(1,1)
al.BackgroundTransparency=1
al.Parent=ak.IconBillboard

local am=Instance.new"UIListLayout"
am.FillDirection=Enum.FillDirection.Horizontal
am.HorizontalAlignment=Enum.HorizontalAlignment.Center
am.VerticalAlignment=Enum.VerticalAlignment.Center
am.Padding=UDim.new(0,5)
am.Parent=al

ak.CharacterIcon=Instance.new"ImageLabel"
ak.CharacterIcon.Name="CharIcon"
ak.CharacterIcon.BackgroundTransparency=1
ak.CharacterIcon.ScaleType=Enum.ScaleType.Fit
ak.CharacterIcon.Parent=al

local an=Instance.new"UICorner"
an.CornerRadius=UDim.new(1,0)
an.Parent=ak.CharacterIcon

ak.DeviceIcon=Instance.new"ImageLabel"
ak.DeviceIcon.Name="DeviceIcon"
ak.DeviceIcon.BackgroundTransparency=1
ak.DeviceIcon.ScaleType=Enum.ScaleType.Fit
ak.DeviceIcon.Parent=al

local ao=Instance.new"UICorner"
ao.CornerRadius=UDim.new(1,0)
ao.Parent=ak.DeviceIcon
end

function aj.Destruct(ak)
if ak.KirkImage then
ak.KirkImage:Destroy()
end

if ak.IconBillboard then
ak.IconBillboard:Destroy()
end

for al=1,#ak.Bin do
ak.Bin[al]:Remove()
end

F(ak)
end

function aj.Update(ak)
local al=ak.Interface

ak.Options=al.teamSettings[al.IsFriendly(ak.Player)and"friendly"or"enemy"]
ak.Character=al.GetCharacter(ak.Player)
ak.Health,ak.MaxHealth=al.GetHealth(ak.Player)
ak.Weapon=al.GetWeapon(ak.Player)
ak.Enabled=ak.Options.enabled
and ak.Character
and not(#al.whitelist>0 and not H(al.whitelist,ak.Player.UserId))

local am=ak.Enabled and N(ak.Character,"Head")

if am then
ak.IconBillboard.Adornee=am
else
ak.IconBillboard.Adornee=nil
end

if not am then
ak.CharCache={}
ak.OnScreen=false
return
end local

an, ao, ap=WorldToScreen(am.Position)
ak.OnScreen=ao
ak.Distance=ap

if al.sharedSettings.limitDistance and ap>al.sharedSettings.maxDistance then
ak.OnScreen=false
end

if ak.OnScreen then
local aq=ak.CharCache
local ar=P(ak.Character)
if not aq[1]or ak.ChildCount~=#ar then
F(aq)

for as=1,#ar do
local at=ar[as]
if L(at,"BasePart")and IsBodyPart(at.Name)then
aq[#aq+1]=at
end
end

ak.ChildCount=#ar
end

ak.Corners=CalculateCorners(GetBoundingBox(aq))
elseif ak.Options.offScreenArrow then
local aq=i.CFrame
local ar=J(aq.Position,aq.RightVector,Vector3.yAxis)
local as=Q(ar,am.Position)
ak.Direction=Vector2.new(as.X,as.Z).Unit
end
end

local ak={}
local al

local function PrefetchKirkAssets()
local am="Fartsaken/Assets/Kirks/"
if not getcustomasset then
return
end

local function Add(an)
if type(an)~="string"or an==""or ak[an]then
return
end

local ao=am..an
if an:sub(-4)==".png"then
ao=ao..".Fart"
end

local ap,aq=pcall(getcustomasset,ao)
if ap and type(aq)=="string"and aq~=""then
ak[an]=aq
end
end

Add(l.default)
for an,ao in ipairs{"survivor","killer"}do
local ap=l[ao]
if type(ap)=="table"then
for aq,ar in pairs(ap)do
Add(ar)
end
end
end

al=ak[l.default]
end

local function GetKirkAsset(am,an)
local ao
local ap=type(l)=="table"and l[am]
if type(ap)=="table"then
local aq=ap[an]
if type(aq)=="string"and aq~=""then
ao=aq
end
end
ao=ao or(type(l)=="table"and l.default)or"OriginalKirk.jpg"
return ak[ao]or al or""
end

PrefetchKirkAssets()

function aj.Render(am)
local an=am.OnScreen or false
local ao=am.Enabled or false
local ap=am.Drawings.Visible
local aq=am.Drawings.Hidden
local ar=am.Drawings.Box3d
local as=am.Interface
local at=am.Options
local au=am.Corners

if not ao then
am:SetVisible(false)
return
end

am:SetVisible(true)

ap.Box.Visible=ao and an and at.box
ap.BoxOutline.Visible=ap.Box.Visible and at.boxOutline
if ap.Box.Visible then
local av=ap.Box
av.Position=au.TopLeft
av.Size=au.BottomRight-au.TopLeft
av.Color=ParseColor(am,at.boxColor[1],false)
av.Transparency=at.boxColor[2]

local aw=ap.BoxOutline
aw.Position=av.Position
aw.Size=av.Size
aw.Color=ParseColor(am,at.boxOutlineColor[1],true)
aw.Transparency=at.boxOutlineColor[2]
end

ap.BoxFill.Visible=ao and an and at.boxFill
if ap.BoxFill.Visible then
local av=ap.BoxFill
av.Position=au.TopLeft
av.Size=au.BottomRight-au.TopLeft
av.Color=ParseColor(am,at.boxFillColor[1],false)
av.Transparency=at.boxFillColor[2]
end

ap.HealthBar.Visible=ao and an and at.healthBar
ap.HealthBarOutline.Visible=ap.HealthBar.Visible and at.healthBarOutline
if ap.HealthBar.Visible then
local av=au.TopLeft-X
local aw=au.BottomLeft-X

local ax=ap.HealthBar
ax.To=aw
ax.From=U(aw,av,am.Health/am.MaxHealth)
ax.Color=R(at.dyingColor,at.healthyColor,am.Health/am.MaxHealth)

local ay=ap.HealthBarOutline
ay.To=aw+Z
ay.From=av-Z
ay.Color=ParseColor(am,at.healthBarOutlineColor[1],true)
ay.Transparency=at.healthBarOutlineColor[2]
end

ap.HealthText.Visible=ao and an and at.healthText
if ap.HealthText.Visible then
local av=au.TopLeft-X
local aw=au.BottomLeft-X

local ax=ap.HealthText
ax.Text=C(am.Health).."hp"
ax.Size=as.sharedSettings.textSize
ax.Font=as.sharedSettings.textFont
ax.Color=ParseColor(am,at.healthTextColor[1],false)
ax.Transparency=at.healthTextColor[2]
ax.Outline=at.healthTextOutline
ax.OutlineColor=ParseColor(am,at.healthTextOutlineColor,true)
ax.Position=U(aw,av,am.Health/am.MaxHealth)
-ax.TextBounds*0.5
-Y
end

ap.Name.Visible=ao and an and at.name
if ap.Name.Visible then
local av=ap.Name
av.Size=as.sharedSettings.textSize
av.Font=as.sharedSettings.textFont
av.Color=ParseColor(am,at.nameColor[1],false)
av.Transparency=at.nameColor[2]
av.Outline=at.nameOutline
av.OutlineColor=ParseColor(am,at.nameOutlineColor,true)
av.Position=(au.TopLeft+au.TopRight)*0.5-Vector2.yAxis*av.TextBounds.Y-_
end

ap.Distance.Visible=ao and an and am.Distance and at.distance
if ap.Distance.Visible then
local av=ap.Distance
av.Text=C(am.Distance).." studs"
av.Size=as.sharedSettings.textSize
av.Font=as.sharedSettings.textFont
av.Color=ParseColor(am,at.distanceColor[1],false)
av.Transparency=at.distanceColor[2]
av.Outline=at.distanceOutline
av.OutlineColor=ParseColor(am,at.distanceOutlineColor,true)
av.Position=(au.BottomLeft+au.BottomRight)*0.5+aa
end

ap.Weapon.Visible=ao and an and at.weapon
if ap.Weapon.Visible then
local av=ap.Weapon
av.Text=am.Weapon
av.Size=as.sharedSettings.textSize
av.Font=as.sharedSettings.textFont
av.Color=ParseColor(am,at.weaponColor[1],false)
av.Transparency=at.weaponColor[2]
av.Outline=at.weaponOutline
av.OutlineColor=ParseColor(am,at.weaponOutlineColor,true)
av.Position=(au.BottomLeft+au.BottomRight)*0.5
+(
ap.Distance.Visible and aa+Vector2.yAxis*ap.Distance.TextBounds.Y
or Vector2.zero
)
end

ap.Tracer.Visible=ao and an and at.tracer
ap.TracerOutline.Visible=ap.Tracer.Visible and at.tracerOutline
if ap.Tracer.Visible then
local av=ap.Tracer
av.Color=ParseColor(am,at.tracerColor[1],false)
av.Transparency=at.tracerColor[2]
av.To=(au.BottomLeft+au.BottomRight)*0.5

if at.tracerOrigin=="Top"then
av.From=Vector2.new(j.X*0.5,0)
elseif at.tracerOrigin=="Middle"then
av.From=j*0.5
else
av.From=Vector2.new(j.X*0.5,j.Y)
end

local aw=ap.TracerOutline
aw.Color=ParseColor(am,at.tracerOutlineColor[1],true)
aw.Transparency=at.tracerOutlineColor[2]
aw.To=av.To
aw.From=av.From
end

aq.Arrow.Visible=ao and not an and at.offScreenArrow
aq.ArrowOutline.Visible=aq.Arrow.Visible and at.offScreenArrowOutline
if aq.Arrow.Visible and am.Direction then
local av=aq.Arrow
av.PointA=S(
T(j*0.5+am.Direction*at.offScreenArrowRadius,Vector2.one*25),
j-Vector2.one*25
)
av.PointB=av.PointA-RotateVector(am.Direction,0.45)*at.offScreenArrowSize
av.PointC=av.PointA-RotateVector(am.Direction,-0.45)*at.offScreenArrowSize
av.Color=ParseColor(am,at.offScreenArrowColor[1],false)
av.Transparency=at.offScreenArrowColor[2]

local aw=aq.ArrowOutline
aw.PointA=av.PointA
aw.PointB=av.PointB
aw.PointC=av.PointC
aw.Color=ParseColor(am,at.offScreenArrowOutlineColor[1],true)
aw.Transparency=at.offScreenArrowOutlineColor[2]
end

local av=ao and an and at.box3d
for aw=1,#ar do
local ax=ar[aw]
for ay=1,#ax do
local az=ax[ay]
az.Visible=av
az.Color=ParseColor(am,at.box3dColor[1],false)
az.Transparency=at.box3dColor[2]
end

if av then
local ay=ax[1]
ay.From=au.Corners[aw]
ay.To=au.Corners[aw==4 and 1 or aw+1]

local az=ax[2]
az.From=au.Corners[aw==4 and 1 or aw+1]
az.To=au.Corners[aw==4 and 5 or aw+5]

local aA=ax[3]
aA.From=au.Corners[aw==4 and 5 or aw+5]
aA.To=au.Corners[aw==4 and 8 or aw+4]
end
end

local aw=am.Distance and am.Distance<=250

am.KirkImage.Visible=ao and an and aw and at.kirkEsp
if am.KirkImage.Visible then
local ax=am.KirkImage
local ay=at.kirkScale or 0.96
local az=(1-ay)*0.5
local aA=au.TopLeft
local aB=au.BottomRight-au.TopLeft

local aC=aA+aB*Vector2.new(az,az)
local aD=aB*ay

ax.Position=UDim2.fromOffset(aC.X,aC.Y)
ax.Size=UDim2.fromOffset(aD.X,aD.Y)
ax.ImageTransparency=1-(at.kirkTransparency or 1)

if at.kirkBackground then
local aE=ParseColor(am,at.kirkBackgroundColor[1],false)
ax.BackgroundColor3=aE
ax.BackgroundTransparency=at.kirkBackgroundColor[2]
else
ax.BackgroundTransparency=1
end

as.GetKirkRole=function(aE)
local aF=as.GetCharacter(aE)
if not aF then
return"default"
end

local aG=aF.Parent
if not aG then
return"default"
end

if aG.Name=="Killers"then
return"killer"
end

if aG.Name=="Survivors"then
return"survivor"
end

return"default"
end

local aE=(as.GetKirkRole and as.GetKirkRole(am.Player))or"default"
local aF=(am.Character and am.Character.Name)or am.Player.Name
ax.Image=GetKirkAsset(aE,aF)or""
end

local ax=am.IconBillboard
local ay=am.CharacterIcon
local az=am.DeviceIcon

ax.Enabled=ao and aw and(at.characterIcon or at.deviceIcon)

if ax.Enabled then
local aA=at.iconSize or 40
local aB=1-(at.iconOpacity or 1)

ay.Size=UDim2.fromOffset(aA,aA)
az.Size=UDim2.fromOffset(aA,aA)

ay.ImageTransparency=aB
az.ImageTransparency=aB
if at.characterIcon then
ay.Visible=true

local aC
local aD=am.Player:FindFirstChild"PlayerData"
local aE=aD and aD:FindFirstChild"Equipped"

if aE and am.Character and am.Character.Parent then
if am.Character.Parent.Name=="Killers"then
local aF=aE:FindFirstChild"Killer"
if aF then
aC=aF.Value
end
elseif am.Character.Parent.Name=="Survivors"then
local aF=aE:FindFirstChild"Survivor"
if aF then
aC=aF.Value
end
end
end

if aC and m[aC]then
ay.Image=m[aC]
else
ay.Visible=false
end
else
ay.Visible=false
end

if at.deviceIcon then
az.Visible=true
local aC=am.Player:GetAttribute"Device"

if aC and n[aC]then
az.Image=n[aC]
else
az.Visible=false
end
else
az.Visible=false
end
end
end

function aj.SetVisible(am,an)
for ao,ap in pairs(am.Drawings)do
for aq,ar in pairs(ap)do
if type(ar)=="table"then
for as,at in pairs(ar)do
at.Visible=an
end
else
ar.Visible=an
end
end
end
if am.KirkImage then
am.KirkImage.Visible=an
end
if am.IconBillboard then
am.IconBillboard.Enabled=an
end
end

local am={}
am.__index=am

function am.New(an,ao)
local ap=setmetatable({},am)
ap.Player=assert(an,"Missing argument #1 (Player expected)")
ap.Interface=assert(ao,"Missing argument #2 (table expected)")

for aq,ar in pairs(g:GetChildren())do
if ar:IsA"Highlight"then
ar:Destroy()
end
end

ap:Construct()
return ap
end

function am.Construct(an)
an.Highlight=Instance.new("Highlight",k)
end

function am.Destruct(an)
an.Highlight:Destroy()
F(an)
end

function am.Update(an)
local ao=an.Highlight
local ap=an.Interface
local aq=ap.GetCharacter(an.Player)
local ar=ap.teamSettings[ap.IsFriendly(an.Player)and"friendly"or"enemy"]
local as=ar.enabled
and aq
and not(#ap.whitelist>0 and not H(ap.whitelist,an.Player.UserId))

ao.Enabled=as and ar.chams
if ao.Enabled then
ao.Adornee=aq
ao.FillColor=ParseColor(an,ar.chamsFillColor[1],false)
ao.FillTransparency=ar.chamsFillColor[2]
ao.OutlineColor=ParseColor(an,ar.chamsOutlineColor[1],true)
ao.OutlineTransparency=ar.chamsOutlineColor[2]
ao.DepthMode=ar.chamsVisibleOnly and"Occluded"or"AlwaysOnTop"
end
end

local an={}
an.__index=an

function an.New(ao,ap)
local aq=setmetatable({},an)
aq.Player=assert(ao,"Missing argument #1 (Player expected)")
aq.Interface=assert(ap,"Missing argument #2 (table expected)")
aq.Bindings={}
aq.Character=nil
return aq
end

function an.Destruct(ao)
for ap in next,ao.Bindings do
if ap.Parent then
ap:Destroy()
end
ao.Bindings[ap]=nil
end
ao.Character=nil
end

function an.Rebuild(ao)
for ap in next,ao.Bindings do
if ap.Parent then
ap:Destroy()
end
ao.Bindings[ap]=nil
end

local ap=ao.Interface
local aq=ap.GetCharacter(ao.Player)
if not aq then
ao.Character=nil
return
end

ao.Character=aq

for ar,as in ipairs(ac:GetChildren())do
if L(as,"BasePart")then
local at=N(aq,as.Name)
if at and L(at,"BasePart")then
local au=as:Clone()
au.Anchored=true
au.CanCollide=false
au.CastShadow=false
au.Parent=ag
ao.Bindings[au]=at
end
end
end
end

function an.Update(ao)
local ap=ao.Interface
local aq=ap.GetCharacter(ao.Player)
local ar=ap.teamSettings[ap.IsFriendly(ao.Player)and"friendly"or"enemy"]
local as=ar.enabled
and ar.skeleton
and aq
and not(#ap.whitelist>0 and not H(ap.whitelist,ao.Player.UserId))

local at=g.CurrentCamera
if at then
i=at
j=i.ViewportSize
af.CFrame=i.CFrame
af.FieldOfView=i.FieldOfView
end

if not as then
for au in next,ao.Bindings do
au.Transparency=1
end
if aq~=ao.Character then
ao:Rebuild()
end
return
end

if aq~=ao.Character or not next(ao.Bindings)then
ao:Rebuild()
end

local au=ParseColor(ao,ar.skeletonColor[1],false)
local av=ar.skeletonColor[2]

for aw,ax in next,ao.Bindings do
if not ax or not ax.Parent then
if aw.Parent then
aw:Destroy()
end
ao.Bindings[aw]=nil
else
aw.CFrame=ax.CFrame
aw.Transparency=av

local ay=aw:FindFirstChild"Mesh"
if not ay then
ay=aw:FindFirstChildWhichIsA"DataModelMesh"
end

if ay then
ay.VertexColor=Vector3.new(au.R,au.G,au.B)
else
aw.Color=au
end
end
end
end

local ao={}
ao.__index=ao

function ao.New(ap,aq)
local ar=setmetatable({},ao)
ar.Instance=assert(ap,"Missing argument #1 (Instance Expected)")
ar.Options=assert(aq,"Missing argument #2 (table expected)")
ar:Construct()
return ar
end

function ao.Construct(ap)
local aq=ap.Options
aq.enabled=aq.enabled==nil and true or aq.enabled
aq.text=aq.text or"{name}"
aq.textColor=aq.textColor or{Color3.new(1,1,1),1}
aq.textOutline=aq.textOutline==nil and true or aq.textOutline
aq.textOutlineColor=aq.textOutlineColor or Color3.new()
aq.textSize=aq.textSize or 13
aq.textFont=aq.textFont or 2
aq.limitDistance=aq.limitDistance or false
aq.maxDistance=aq.maxDistance or 150

ap.TextDrawing=Drawing.new"Text"
ap.TextDrawing.Center=true
end

function ao.Destruct(ap)
ap.TextDrawing:Remove()
end

function ao.Render(ap)
local aq=ap.Instance
if not aq or not aq.Parent then
return ap:Destruct()
end

local ar=ap.TextDrawing
local as=ap.Options
if not as.enabled then
ar.Visible=false
return
end

local at=M(aq).Position
local au,av,aw=WorldToScreen(at)
if as.limitDistance and aw>as.maxDistance then
av=false
end

ar.Visible=av
if ar.Visible then
ar.Position=au
ar.Color=as.textColor[1]
ar.Transparency=as.textColor[2]
ar.Outline=as.textOutline
ar.OutlineColor=as.textOutlineColor
ar.Size=as.textSize
ar.Font=as.textFont
ar.Text=as.text
:gsub("{name}",aq.Name)
:gsub("{distance}",C(aw))
:gsub("{position}",tostring(at))
end
end

local ap={
_HasLoaded=false,
_ObjectCache={},
whitelist={},
sharedSettings={
textSize=13,
textFont=2,
limitDistance=false,
maxDistance=150,
useTeamColor=false,
},
teamSettings={
enemy={
enabled=false,
box=false,
boxColor={Color3.new(1,0,0),1},
boxOutline=true,
boxOutlineColor={Color3.new(),1},
boxFill=false,
boxFillColor={Color3.new(1,0,0),0.5},
healthBar=false,
healthyColor=Color3.new(0,1,0),
dyingColor=Color3.new(1,0,0),
healthBarOutline=true,
healthBarOutlineColor={Color3.new(),0.5},
healthText=false,
healthTextColor={Color3.new(1,1,1),1},
healthTextOutline=true,
healthTextOutlineColor=Color3.new(),
box3d=false,
box3dColor={Color3.new(1,0,0),1},
name=false,
nameColor={Color3.new(1,1,1),1},
nameOutline=true,
nameOutlineColor=Color3.new(),
weapon=false,
weaponColor={Color3.new(1,1,1),1},
weaponOutline=true,
weaponOutlineColor=Color3.new(),
distance=false,
distanceColor={Color3.new(1,1,1),1},
distanceOutline=true,
distanceOutlineColor=Color3.new(),
tracer=false,
tracerOrigin="Bottom",
tracerColor={Color3.new(1,0,0),1},
tracerOutline=true,
tracerOutlineColor={Color3.new(),1},
offScreenArrow=false,
offScreenArrowColor={Color3.new(1,1,1),1},
offScreenArrowSize=15,
offScreenArrowRadius=150,
offScreenArrowOutline=true,
offScreenArrowOutlineColor={Color3.new(),1},
chams=false,
chamsVisibleOnly=false,
chamsFillColor={Color3.new(0.2,0.2,0.2),0.5},
chamsOutlineColor={Color3.new(1,0,0),0},
skeleton=false,
skeletonColor={Color3.new(1,1,1),0},
kirkEsp=false,
kirkScale=0.96,
kirkTransparency=1,
kirkBackground=false,
kirkBackgroundColor={Color3.new(1,1,1),0},
characterIcon=false,
deviceIcon=false,
iconSize=40,
iconOpacity=1,
},
friendly={
enabled=false,
box=false,
boxColor={Color3.new(0,1,0),1},
boxOutline=true,
boxOutlineColor={Color3.new(),1},
boxFill=false,
boxFillColor={Color3.new(0,1,0),0.5},
healthBar=false,
healthyColor=Color3.new(0,1,0),
dyingColor=Color3.new(1,0,0),
healthBarOutline=true,
healthBarOutlineColor={Color3.new(),0.5},
healthText=false,
healthTextColor={Color3.new(1,1,1),1},
healthTextOutline=true,
healthTextOutlineColor=Color3.new(),
box3d=false,
box3dColor={Color3.new(0,1,0),1},
name=false,
nameColor={Color3.new(1,1,1),1},
nameOutline=true,
nameOutlineColor=Color3.new(),
weapon=false,
weaponColor={Color3.new(1,1,1),1},
weaponOutline=true,
weaponOutlineColor=Color3.new(),
distance=false,
distanceColor={Color3.new(1,1,1),1},
distanceOutline=true,
distanceOutlineColor=Color3.new(),
tracer=false,
tracerOrigin="Bottom",
tracerColor={Color3.new(0,1,0),1},
tracerOutline=true,
tracerOutlineColor={Color3.new(),1},
offScreenArrow=false,
offScreenArrowColor={Color3.new(1,1,1),1},
offScreenArrowSize=15,
offScreenArrowRadius=150,
offScreenArrowOutline=true,
offScreenArrowOutlineColor={Color3.new(),1},
chams=false,
chamsVisibleOnly=false,
chamsFillColor={Color3.new(0.2,0.2,0.2),0.5},
chamsOutlineColor={Color3.new(0,1,0),0},
skeleton=false,
skeletonColor={Color3.new(1,1,1),0},
kirkEsp=false,
kirkScale=0.96,
kirkTransparency=1,
kirkBackground=false,
kirkBackgroundColor={Color3.new(1,1,1),0},
characterIcon=false,
deviceIcon=false,
iconSize=40,
iconOpacity=1,
},
},
}

function ap.AddInstance(aq,ar)
local as=ap._ObjectCache
if as[aq]then
warn"Instance handler already exists."
else
as[aq]={ao.New(aq,ar)}
end
return as[aq][1]
end

function ap.Load()
assert(not ap._HasLoaded,"Esp has already been loaded.")

local function CreateObject(aq)
ap._ObjectCache[aq]={
aj.New(aq,ap),
am.New(aq,ap),
an.New(aq,ap),
}
end

local function RemoveObject(aq)
local ar=ap._ObjectCache[aq]
if ar then
for as=1,#ar do
ar[as]:Destruct()
end
ap._ObjectCache[aq]=nil
end
end

local aq=f:GetPlayers()
for ar=2,#aq do
CreateObject(aq[ar])
end

ap.PlayerAdded=f.PlayerAdded:Connect(CreateObject)
ap.PlayerRemoving=f.PlayerRemoving:Connect(RemoveObject)

ap.RenderConnection=e.RenderStepped:Connect(function(ar)
i=g.CurrentCamera
j=i.ViewportSize

for as,at in pairs(ap._ObjectCache)do
if at[1]then
at[1]:Update(ar)
at[1]:Render(ar)
end
if at[2]then
at[2]:Update()
end
if at[3]then
at[3]:Update()
end
end
end)

ap._HasLoaded=true
end

function ap.Unload()
assert(ap._HasLoaded,"Esp has not been loaded yet.")

for aq,ar in next,ap._ObjectCache do
for as=1,#ar do
ar[as]:Destruct()
end
ap._ObjectCache[aq]=nil
end

ap.PlayerAdded:Disconnect()
ap.PlayerRemoving:Disconnect()
ap.RenderConnection:Disconnect()
ap._HasLoaded=false
end

function ap.GetWeapon(aq)
return"Unknown"
end

function ap.IsFriendly(aq)
if aq.Character and aq.Character.Parent then
return aq.Character.Parent.Name=="Survivors"
end

return false
end

function ap.GetTeamColor(aq)
return aq.Team and aq.Team.TeamColor and aq.Team.TeamColor.Color
end

function ap.GetCharacter(aq)
return aq.Character
end

function ap.GetHealth(aq)
local ar=aq and ap.GetCharacter(aq)
local as=ar and O(ar,"Humanoid")
if as then
return as.Health,as.MaxHealth
end
return 100,100
end

return ap
