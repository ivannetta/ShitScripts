--!nocheck
--!nolint

local CoreGui: CoreGui = game:GetService("CoreGui")
local RS: RunService = game:GetService("RunService")
local Players: Players = game:GetService("Players")
local Workspace: Workspace = workspace

local LocalPlayer: Player = Players.LocalPlayer
local Camera: Camera = Workspace.CurrentCamera
local ViewportSize: Vector2 = Camera.ViewportSize

local Container: Folder = Instance.new("Folder", (gethui and gethui()) or CoreGui)

local KirkImages = getgenv().KirkImages or {
	default = "OriginalKirk.jpg",
	survivor = {},
	killer = {},
}
getgenv().KirkImages = KirkImages

local Skeleton: Model = Instance.new("Model")
Skeleton.Name = "Skeleton"
Skeleton.WorldPivot = CFrame.new(-3, 2.5, 71.3599701, 1, 0, 0, 0, 1, 0, 0, 0, 1)

local Head: Part = Instance.new("Part")
Head.Name = "Head"
Head.Anchored = true
Head.BottomSurface = Enum.SurfaceType.Smooth
Head.BrickColor = BrickColor.Black()
Head.CFrame = CFrame.new(-3, 4.5, 71.3599701, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Head.Color = Color3.fromRGB(27, 42, 53)
Head.Size = Vector3.new(1.7, 0.851, 0.851)
Head.TopSurface = Enum.SurfaceType.Smooth

local Mesh: SpecialMesh = Instance.new("SpecialMesh")
Mesh.Name = "Mesh"
Mesh.MeshType = Enum.MeshType.FileMesh
Mesh.MeshId = "rbxassetid://36869983"
Mesh.TextureId = "rbxassetid://36869975"
Mesh.Scale = Vector3.new(0.851, 0.851, 0.851)
Mesh.Parent = Head

Head.Parent = Skeleton

local Torso: Part = Instance.new("Part")
Torso.Name = "Torso"
Torso.Anchored = true
Torso.BottomSurface = Enum.SurfaceType.Smooth
Torso.BrickColor = BrickColor.Black()
Torso.CFrame = CFrame.new(-3, 3, 71.3599701, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Torso.Color = Color3.fromRGB(27, 42, 53)
Torso.Size = Vector3.new(2, 2, 1)
Torso.TopSurface = Enum.SurfaceType.Smooth

local Mesh1: SpecialMesh = Instance.new("SpecialMesh")
Mesh1.Name = "Mesh"
Mesh1.MeshType = Enum.MeshType.FileMesh
Mesh1.MeshId = "rbxassetid://36780113"
Mesh1.TextureId = "rbxassetid://36780292"
Mesh1.Parent = Torso

Torso.Parent = Skeleton

local RightArm: Part = Instance.new("Part")
RightArm.Name = "Right Arm"
RightArm.Anchored = true
RightArm.BottomSurface = Enum.SurfaceType.Smooth
RightArm.BrickColor = BrickColor.Black()
RightArm.CFrame = CFrame.new(-1.5, 3, 71.3599701, 1, 0, 0, 0, 1, 0, 0, 0, 1)
RightArm.Color = Color3.fromRGB(27, 42, 53)
RightArm.Size = Vector3.new(1, 2, 1)
RightArm.TopSurface = Enum.SurfaceType.Smooth

local Mesh2: SpecialMesh = Instance.new("SpecialMesh")
Mesh2.Name = "Mesh"
Mesh2.MeshType = Enum.MeshType.FileMesh
Mesh2.MeshId = "rbxassetid://36780156"
Mesh2.TextureId = "rbxassetid://36780292"
Mesh2.Parent = RightArm

RightArm.Parent = Skeleton

local LeftArm: Part = Instance.new("Part")
LeftArm.Name = "Left Arm"
LeftArm.Anchored = true
LeftArm.BottomSurface = Enum.SurfaceType.Smooth
LeftArm.BrickColor = BrickColor.Black()
LeftArm.CFrame = CFrame.new(-4.5, 3, 71.3599701, 1, 0, 0, 0, 1, 0, 0, 0, 1)
LeftArm.Color = Color3.fromRGB(27, 42, 53)
LeftArm.Size = Vector3.new(1, 2, 1)
LeftArm.TopSurface = Enum.SurfaceType.Smooth

local Mesh3: SpecialMesh = Instance.new("SpecialMesh")
Mesh3.Name = "Mesh"
Mesh3.MeshType = Enum.MeshType.FileMesh
Mesh3.MeshId = "rbxassetid://36780032"
Mesh3.TextureId = "rbxassetid://36780292"
Mesh3.Parent = LeftArm

LeftArm.Parent = Skeleton

local LeftLeg: Part = Instance.new("Part")
LeftLeg.Name = "Left Leg"
LeftLeg.Anchored = true
LeftLeg.BottomSurface = Enum.SurfaceType.Smooth
LeftLeg.BrickColor = BrickColor.Black()
LeftLeg.CFrame = CFrame.new(-3.5, 1, 71.3599701, 1, 0, 0, 0, 1, 0, 0, 0, 1)
LeftLeg.Color = Color3.fromRGB(27, 42, 53)
LeftLeg.Size = Vector3.new(1, 2, 1)
LeftLeg.TopSurface = Enum.SurfaceType.Smooth

local Mesh4: SpecialMesh = Instance.new("SpecialMesh")
Mesh4.Name = "Mesh"
Mesh4.MeshType = Enum.MeshType.FileMesh
Mesh4.MeshId = "rbxassetid://36780079"
Mesh4.TextureId = "rbxassetid://36780292"
Mesh4.Parent = LeftLeg

LeftLeg.Parent = Skeleton

local RightLeg: Part = Instance.new("Part")
RightLeg.Name = "Right Leg"
RightLeg.Anchored = true
RightLeg.BottomSurface = Enum.SurfaceType.Smooth
RightLeg.BrickColor = BrickColor.Black()
RightLeg.CFrame = CFrame.new(-2.5, 1, 71.3599701, 1, 0, 0, 0, 1, 0, 0, 0, 1)
RightLeg.Color = Color3.fromRGB(27, 42, 53)
RightLeg.Size = Vector3.new(1, 2, 1)
RightLeg.TopSurface = Enum.SurfaceType.Smooth

local Mesh5: SpecialMesh = Instance.new("SpecialMesh")
Mesh5.Name = "Mesh"
Mesh5.MeshType = Enum.MeshType.FileMesh
Mesh5.MeshId = "rbxassetid://36780195"
Mesh5.TextureId = "rbxassetid://36780292"
Mesh5.Parent = RightLeg

RightLeg.Parent = Skeleton
Skeleton.Parent = Container

local Floor = math.floor
local Round = math.round
local Sin = math.sin
local Cos = math.cos
local Clear = table.clear
local Unpack = table.unpack
local Find = table.find
local Create = table.create
local FromMatrix = CFrame.fromMatrix

local WTVP = Camera.WorldToViewportPoint
local IsA = Workspace.IsA
local GetPivot = Workspace.GetPivot
local FindFirstChild = Workspace.FindFirstChild
local FindFirstChildOfClass = Workspace.FindFirstChildOfClass
local GetChildren = Workspace.GetChildren
local ToOrientation = CFrame.identity.ToOrientation
local PointToObjectSpace = CFrame.identity.PointToObjectSpace
local LerpColor = Color3.new().Lerp
local Min2 = Vector2.zero.Min
local Max2 = Vector2.zero.Max
local Lerp2 = Vector2.zero.Lerp
local Min3 = Vector3.zero.Min
local Max3 = Vector3.zero.Max

local HEALTH_BAR_OFFSET: Vector2 = Vector2.new(5, 0)
local HEALTH_TEXT_OFFSET: Vector2 = Vector2.new(3, 0)
local HEALTH_BAR_OUTLINE_OFFSET: Vector2 = Vector2.new(0, 1)
local NAME_OFFSET: Vector2 = Vector2.new(0, 2)
local DISTANCE_OFFSET: Vector2 = Vector2.new(0, 2)
local VERTICES: { Vector3 } = {
	Vector3.new(-1, -1, -1),
	Vector3.new(-1, 1, -1),
	Vector3.new(-1, 1, 1),
	Vector3.new(-1, -1, 1),
	Vector3.new(1, -1, -1),
	Vector3.new(1, 1, -1),
	Vector3.new(1, 1, 1),
	Vector3.new(1, -1, 1),
}

local SkeletonSource: Model = Container:WaitForChild("Skeleton")

local SkeletonGui: ScreenGui = Instance.new("ScreenGui")
SkeletonGui.Name = "SkeletonOverlay"
SkeletonGui.IgnoreGuiInset = true
SkeletonGui.DisplayOrder = 200
SkeletonGui.ResetOnSpawn = false
SkeletonGui.Parent = (gethui and gethui()) or CoreGui

local SkeletonViewport: ViewportFrame = Instance.new("ViewportFrame")
SkeletonViewport.Size = UDim2.fromScale(1, 1)
SkeletonViewport.BackgroundTransparency = 1
SkeletonViewport.Ambient = Color3.new(1, 1, 1)
SkeletonViewport.LightColor = Color3.new(1, 1, 1)
SkeletonViewport.Parent = SkeletonGui

local SkeletonCamera: Camera = Instance.new("Camera")
SkeletonCamera.Parent = SkeletonViewport
SkeletonViewport.CurrentCamera = SkeletonCamera

local SkeletonWorld: WorldModel = Instance.new("WorldModel")
SkeletonWorld.Parent = SkeletonViewport

local KirkGui: ScreenGui = Instance.new("ScreenGui")
KirkGui.Name = "KirkOverlay"
KirkGui.IgnoreGuiInset = true
KirkGui.DisplayOrder = 201
KirkGui.ResetOnSpawn = false
KirkGui.Parent = (gethui and gethui()) or CoreGui

local function IsBodyPart(Name: string): boolean
	return Name == "Head" or Name:find("Torso") or Name:find("Leg") or Name:find("Arm")
end

local function GetBoundingBox(Parts: { BasePart }): (CFrame, Vector3)
	local Min: Vector3, Max: Vector3
	for i = 1, #Parts do
		local Part = Parts[i]
		local Cframe, Size = Part.CFrame, Part.Size

		Min = Min3(Min or Cframe.Position, (Cframe - Size * 0.5).Position)
		Max = Max3(Max or Cframe.Position, (Cframe + Size * 0.5).Position)
	end

	local Center = (Min + Max) * 0.5
	local Front = Vector3.new(Center.X, Center.Y, Max.Z)
	return CFrame.new(Center, Front), Max - Min
end

local function WorldToScreen(World: Vector3): (Vector2, boolean, number)
	local Screen, InBounds = WTVP(Camera, World)
	return Vector2.new(Screen.X, Screen.Y), InBounds, Screen.Z
end

local function CalculateCorners(Cframe: CFrame, Size: Vector3): table
	local Corners = Create(#VERTICES)
	for i = 1, #VERTICES do
		Corners[i] = WorldToScreen((Cframe + Size * 0.5 * VERTICES[i]).Position)
	end

	local Min = Min2(ViewportSize, Unpack(Corners))
	local Max = Max2(Vector2.zero, Unpack(Corners))
	return {
		Corners = Corners,
		TopLeft = Vector2.new(Floor(Min.X), Floor(Min.Y)),
		TopRight = Vector2.new(Floor(Max.X), Floor(Min.Y)),
		BottomLeft = Vector2.new(Floor(Min.X), Floor(Max.Y)),
		BottomRight = Vector2.new(Floor(Max.X), Floor(Max.Y)),
	}
end

local function RotateVector(Vector: Vector2, Radians: number): Vector2
	local X, Y = Vector.X, Vector.Y
	local C, S = Cos(Radians), Sin(Radians)
	return Vector2.new(X * C - Y * S, X * S + Y * C)
end

local function ParseColor(Self: any, Color: Color3 | string, IsOutline: boolean): Color3
	if Color == "Team Color" or (Self.Interface.sharedSettings.useTeamColor and not IsOutline) then
		return Self.Interface.GetTeamColor(Self.Player) or Color3.new(1, 1, 1)
	end
	return Color
end

local EspObject = {}
EspObject.__index = EspObject

function EspObject.New(Player: Player, Interface: table)
	local Self = setmetatable({}, EspObject)
	Self.Player = assert(Player, "Missing argument #1 (Player expected)")
	Self.Interface = assert(Interface, "Missing argument #2 (table expected)")
	Self:Construct()
	return Self
end

function EspObject:_Create(Class: string, Properties: table)
	local DrawingObject = Drawing.new(Class)
	for Property, Value in next, Properties do
		pcall(function()
			DrawingObject[Property] = Value
		end)
	end
	self.Bin[#self.Bin + 1] = DrawingObject
	return DrawingObject
end

function EspObject:Construct()
	self.CharCache = {}
	self.ChildCount = 0
	self.Bin = {}
	self.Drawings = {
		Box3d = {
			{
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
			},
			{
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
			},
			{
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
			},
			{
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
			},
		},
		Visible = {
			TracerOutline = self:_Create("Line", { Thickness = 3, Visible = false }),
			Tracer = self:_Create("Line", { Thickness = 1, Visible = false }),
			BoxFill = self:_Create("Square", { Filled = true, Visible = false }),
			BoxOutline = self:_Create("Square", { Thickness = 3, Visible = false }),
			Box = self:_Create("Square", { Thickness = 1, Visible = false }),
			HealthBarOutline = self:_Create("Line", { Thickness = 3, Visible = false }),
			HealthBar = self:_Create("Line", { Thickness = 1, Visible = false }),
			HealthText = self:_Create("Text", { Center = true, Visible = false }),
			Name = self:_Create("Text", { Text = self.Player.DisplayName, Center = true, Visible = false }),
			Distance = self:_Create("Text", { Center = true, Visible = false }),
			Weapon = self:_Create("Text", { Center = true, Visible = false }),
		},
		Hidden = {
			ArrowOutline = self:_Create("Triangle", { Thickness = 3, Visible = false }),
			Arrow = self:_Create("Triangle", { Filled = true, Visible = false }),
		},
	}

	self.KirkImage = Instance.new("ImageLabel")
	self.KirkImage.Name = "KirkImage_" .. self.Player.Name
	self.KirkImage.BackgroundTransparency = 1
	self.KirkImage.BorderSizePixel = 0
	self.KirkImage.ScaleType = Enum.ScaleType.Stretch
	self.KirkImage.Visible = false
	self.KirkImage.Parent = KirkGui

	self.RenderConnection = RS.Heartbeat:Connect(function(DeltaTime: number)
		self:Update(DeltaTime)
		self:Render(DeltaTime)
	end)
end

function EspObject:Destruct()
	self.RenderConnection:Disconnect()

	if self.KirkImage then
		self.KirkImage:Destroy()
	end

	for i = 1, #self.Bin do
		self.Bin[i]:Remove()
	end

	Clear(self)
end

function EspObject:Update()
	local Interface = self.Interface

	self.Options = Interface.teamSettings[Interface.IsFriendly(self.Player) and "friendly" or "enemy"]
	self.Character = Interface.GetCharacter(self.Player)
	self.Health, self.MaxHealth = Interface.GetHealth(self.Player)
	self.Weapon = Interface.GetWeapon(self.Player)
	self.Enabled = self.Options.enabled
		and self.Character
		and not (#Interface.whitelist > 0 and not Find(Interface.whitelist, self.Player.UserId))

	local TargetHead = self.Enabled and FindFirstChild(self.Character, "Head")
	if not TargetHead then
		self.CharCache = {}
		self.OnScreen = false
		return
	end

	local _, OnScreen, Depth = WorldToScreen(TargetHead.Position)
	self.OnScreen = OnScreen
	self.Distance = Depth

	if Interface.sharedSettings.limitDistance and Depth > Interface.sharedSettings.maxDistance then
		self.OnScreen = false
	end

	if self.OnScreen then
		local Cache = self.CharCache
		local Children = GetChildren(self.Character)
		if not Cache[1] or self.ChildCount ~= #Children then
			Clear(Cache)

			for i = 1, #Children do
				local Part = Children[i]
				if IsA(Part, "BasePart") and IsBodyPart(Part.Name) then
					Cache[#Cache + 1] = Part
				end
			end

			self.ChildCount = #Children
		end

		self.Corners = CalculateCorners(GetBoundingBox(Cache))
	elseif self.Options.offScreenArrow then
		local CameraCFrame = Camera.CFrame
		local Flat = FromMatrix(CameraCFrame.Position, CameraCFrame.RightVector, Vector3.yAxis)
		local ObjectSpace = PointToObjectSpace(Flat, TargetHead.Position)
		self.Direction = Vector2.new(ObjectSpace.X, ObjectSpace.Z).Unit
	end
end

local KirkAssetCache = {}
local KirkDefaultAsset = nil

local function PrefetchKirkAssets()
	local Base = "Fartsaken/Assets/Kirks/"
	if not getcustomasset then
		return
	end

	local function Add(File: string)
		if type(File) ~= "string" or File == "" or KirkAssetCache[File] then
			return
		end

		local Path = Base .. File
		if File:sub(-4) == ".png" then
			Path = Path .. ".Fart"
		end

		local Success, Asset = pcall(getcustomasset, Path)
		if Success and type(Asset) == "string" and Asset ~= "" then
			KirkAssetCache[File] = Asset
		end
	end

	Add(KirkImages.default)
	for _, Role in ipairs({ "survivor", "killer" }) do
		local T = KirkImages[Role]
		if type(T) == "table" then
			for _, File in pairs(T) do
				Add(File)
			end
		end
	end

	KirkDefaultAsset = KirkAssetCache[KirkImages.default]
end

local function GetKirkAsset(Role: string, PlayerName: string): string
	local File
	local RoleTable = type(KirkImages) == "table" and KirkImages[Role]
	if type(RoleTable) == "table" then
		local V = RoleTable[PlayerName]
		if type(V) == "string" and V ~= "" then
			File = V
		end
	end
	File = File or (type(KirkImages) == "table" and KirkImages.default) or "OriginalKirk.jpg"
	return KirkAssetCache[File] or KirkDefaultAsset or ""
end

PrefetchKirkAssets()

function EspObject:Render()
	local OnScreen = self.OnScreen or false
	local Enabled = self.Enabled or false
	local Visible = self.Drawings.Visible
	local Hidden = self.Drawings.Hidden
	local Box3d = self.Drawings.Box3d
	local Interface = self.Interface
	local Options = self.Options
	local Corners = self.Corners

	Visible.Box.Visible = Enabled and OnScreen and Options.box
	Visible.BoxOutline.Visible = Visible.Box.Visible and Options.boxOutline
	if Visible.Box.Visible then
		local Box = Visible.Box
		Box.Position = Corners.TopLeft
		Box.Size = Corners.BottomRight - Corners.TopLeft
		Box.Color = ParseColor(self, Options.boxColor[1], false)
		Box.Transparency = Options.boxColor[2]

		local BoxOutline = Visible.BoxOutline
		BoxOutline.Position = Box.Position
		BoxOutline.Size = Box.Size
		BoxOutline.Color = ParseColor(self, Options.boxOutlineColor[1], true)
		BoxOutline.Transparency = Options.boxOutlineColor[2]
	end

	Visible.BoxFill.Visible = Enabled and OnScreen and Options.boxFill
	if Visible.BoxFill.Visible then
		local BoxFill = Visible.BoxFill
		BoxFill.Position = Corners.TopLeft
		BoxFill.Size = Corners.BottomRight - Corners.TopLeft
		BoxFill.Color = ParseColor(self, Options.boxFillColor[1], false)
		BoxFill.Transparency = Options.boxFillColor[2]
	end

	Visible.HealthBar.Visible = Enabled and OnScreen and Options.healthBar
	Visible.HealthBarOutline.Visible = Visible.HealthBar.Visible and Options.healthBarOutline
	if Visible.HealthBar.Visible then
		local BarFrom = Corners.TopLeft - HEALTH_BAR_OFFSET
		local BarTo = Corners.BottomLeft - HEALTH_BAR_OFFSET

		local HealthBar = Visible.HealthBar
		HealthBar.To = BarTo
		HealthBar.From = Lerp2(BarTo, BarFrom, self.Health / self.MaxHealth)
		HealthBar.Color = LerpColor(Options.dyingColor, Options.healthyColor, self.Health / self.MaxHealth)

		local HealthBarOutline = Visible.HealthBarOutline
		HealthBarOutline.To = BarTo + HEALTH_BAR_OUTLINE_OFFSET
		HealthBarOutline.From = BarFrom - HEALTH_BAR_OUTLINE_OFFSET
		HealthBarOutline.Color = ParseColor(self, Options.healthBarOutlineColor[1], true)
		HealthBarOutline.Transparency = Options.healthBarOutlineColor[2]
	end

	Visible.HealthText.Visible = Enabled and OnScreen and Options.healthText
	if Visible.HealthText.Visible then
		local BarFrom = Corners.TopLeft - HEALTH_BAR_OFFSET
		local BarTo = Corners.BottomLeft - HEALTH_BAR_OFFSET

		local HealthText = Visible.HealthText
		HealthText.Text = Round(self.Health) .. "hp"
		HealthText.Size = Interface.sharedSettings.textSize
		HealthText.Font = Interface.sharedSettings.textFont
		HealthText.Color = ParseColor(self, Options.healthTextColor[1], false)
		HealthText.Transparency = Options.healthTextColor[2]
		HealthText.Outline = Options.healthTextOutline
		HealthText.OutlineColor = ParseColor(self, Options.healthTextOutlineColor, true)
		HealthText.Position = Lerp2(BarTo, BarFrom, self.Health / self.MaxHealth)
			- HealthText.TextBounds * 0.5
			- HEALTH_TEXT_OFFSET
	end

	Visible.Name.Visible = Enabled and OnScreen and Options.name
	if Visible.Name.Visible then
		local Name = Visible.Name
		Name.Size = Interface.sharedSettings.textSize
		Name.Font = Interface.sharedSettings.textFont
		Name.Color = ParseColor(self, Options.nameColor[1], false)
		Name.Transparency = Options.nameColor[2]
		Name.Outline = Options.nameOutline
		Name.OutlineColor = ParseColor(self, Options.nameOutlineColor, true)
		Name.Position = (Corners.TopLeft + Corners.TopRight) * 0.5 - Vector2.yAxis * Name.TextBounds.Y - NAME_OFFSET
	end

	Visible.Distance.Visible = Enabled and OnScreen and self.Distance and Options.distance
	if Visible.Distance.Visible then
		local Distance = Visible.Distance
		Distance.Text = Round(self.Distance) .. " studs"
		Distance.Size = Interface.sharedSettings.textSize
		Distance.Font = Interface.sharedSettings.textFont
		Distance.Color = ParseColor(self, Options.distanceColor[1], false)
		Distance.Transparency = Options.distanceColor[2]
		Distance.Outline = Options.distanceOutline
		Distance.OutlineColor = ParseColor(self, Options.distanceOutlineColor, true)
		Distance.Position = (Corners.BottomLeft + Corners.BottomRight) * 0.5 + DISTANCE_OFFSET
	end

	Visible.Weapon.Visible = Enabled and OnScreen and Options.weapon
	if Visible.Weapon.Visible then
		local Weapon = Visible.Weapon
		Weapon.Text = self.Weapon
		Weapon.Size = Interface.sharedSettings.textSize
		Weapon.Font = Interface.sharedSettings.textFont
		Weapon.Color = ParseColor(self, Options.weaponColor[1], false)
		Weapon.Transparency = Options.weaponColor[2]
		Weapon.Outline = Options.weaponOutline
		Weapon.OutlineColor = ParseColor(self, Options.weaponOutlineColor, true)
		Weapon.Position = (Corners.BottomLeft + Corners.BottomRight) * 0.5
			+ (
				Visible.Distance.Visible and DISTANCE_OFFSET + Vector2.yAxis * Visible.Distance.TextBounds.Y
				or Vector2.zero
			)
	end

	Visible.Tracer.Visible = Enabled and OnScreen and Options.tracer
	Visible.TracerOutline.Visible = Visible.Tracer.Visible and Options.tracerOutline
	if Visible.Tracer.Visible then
		local Tracer = Visible.Tracer
		Tracer.Color = ParseColor(self, Options.tracerColor[1], false)
		Tracer.Transparency = Options.tracerColor[2]
		Tracer.To = (Corners.BottomLeft + Corners.BottomRight) * 0.5
		Tracer.From = Options.tracerOrigin == "Middle" and ViewportSize * 0.5
			or Options.tracerOrigin == "Top" and ViewportSize * Vector2.new(0.5, 0)
			or Options.tracerOrigin == "Bottom" and ViewportSize * Vector2.new(0.5, 1)

		local TracerOutline = Visible.TracerOutline
		TracerOutline.Color = ParseColor(self, Options.tracerOutlineColor[1], true)
		TracerOutline.Transparency = Options.tracerOutlineColor[2]
		TracerOutline.To = Tracer.To
		TracerOutline.From = Tracer.From
	end

	Hidden.Arrow.Visible = Enabled and not OnScreen and Options.offScreenArrow
	Hidden.ArrowOutline.Visible = Hidden.Arrow.Visible and Options.offScreenArrowOutline
	if Hidden.Arrow.Visible and self.Direction then
		local Arrow = Hidden.Arrow
		Arrow.PointA = Min2(
			Max2(ViewportSize * 0.5 + self.Direction * Options.offScreenArrowRadius, Vector2.one * 25),
			ViewportSize - Vector2.one * 25
		)
		Arrow.PointB = Arrow.PointA - RotateVector(self.Direction, 0.45) * Options.offScreenArrowSize
		Arrow.PointC = Arrow.PointA - RotateVector(self.Direction, -0.45) * Options.offScreenArrowSize
		Arrow.Color = ParseColor(self, Options.offScreenArrowColor[1], false)
		Arrow.Transparency = Options.offScreenArrowColor[2]

		local ArrowOutline = Hidden.ArrowOutline
		ArrowOutline.PointA = Arrow.PointA
		ArrowOutline.PointB = Arrow.PointB
		ArrowOutline.PointC = Arrow.PointC
		ArrowOutline.Color = ParseColor(self, Options.offScreenArrowOutlineColor[1], true)
		ArrowOutline.Transparency = Options.offScreenArrowOutlineColor[2]
	end

	local Box3dEnabled = Enabled and OnScreen and Options.box3d
	for i = 1, #Box3d do
		local Face = Box3d[i]
		for i2 = 1, #Face do
			local Line = Face[i2]
			Line.Visible = Box3dEnabled
			Line.Color = ParseColor(self, Options.box3dColor[1], false)
			Line.Transparency = Options.box3dColor[2]
		end

		if Box3dEnabled then
			local Line1 = Face[1]
			Line1.From = Corners.Corners[i]
			Line1.To = Corners.Corners[i == 4 and 1 or i + 1]

			local Line2 = Face[2]
			Line2.From = Corners.Corners[i == 4 and 1 or i + 1]
			Line2.To = Corners.Corners[i == 4 and 5 or i + 5]

			local Line3 = Face[3]
			Line3.From = Corners.Corners[i == 4 and 5 or i + 5]
			Line3.To = Corners.Corners[i == 4 and 8 or i + 4]
		end
	end

	self.KirkImage.Visible = Enabled and OnScreen and Options.kirkEsp
	if self.KirkImage.Visible then
		if not Visible.Box.Visible then
			self.KirkImage.Visible = false
		else
			local Img = self.KirkImage
			local Scale = Options.kirkScale or 0.96
			local Padding = (1 - Scale) * 0.5
			local BoxPos = Visible.Box.Position
			local BoxSize = Visible.Box.Size

			local FinalPos = BoxPos + BoxSize * Vector2.new(Padding, Padding)
			local FinalSize = BoxSize * Scale

			Img.Position = UDim2.fromOffset(FinalPos.X, FinalPos.Y)
			Img.Size = UDim2.fromOffset(FinalSize.X, FinalSize.Y)
			Img.ImageTransparency = 1 - (Options.kirkTransparency or 1)

			if Options.kirkBackground then
				local BgColor = ParseColor(self, Options.kirkBackgroundColor[1], false)
				Img.BackgroundColor3 = BgColor
				Img.BackgroundTransparency = Options.kirkBackgroundColor[2]
			else
				Img.BackgroundTransparency = 1
			end

			Interface.GetKirkRole = function(TargetPlayer: Player)
				local Character = Interface.GetCharacter(TargetPlayer)
				if not Character then
					return "default"
				end

				local Parent = Character.Parent
				if not Parent then
					return "default"
				end

				if Parent.Name == "Killers" then
					return "killer"
				end

				if Parent.Name == "Survivors" then
					return "survivor"
				end

				return "default"
			end

			local Role = (Interface.GetKirkRole and Interface.GetKirkRole(self.Player)) or "default"
			local CharName = (self.Character and self.Character.Name) or self.Player.Name
			Img.Image = GetKirkAsset(Role, CharName) or ""
		end
	end
end

local ChamObject = {}
ChamObject.__index = ChamObject

function ChamObject.New(Player: Player, Interface: table)
	local Self = setmetatable({}, ChamObject)
	Self.Player = assert(Player, "Missing argument #1 (Player expected)")
	Self.Interface = assert(Interface, "Missing argument #2 (table expected)")

	for _, HL in pairs(Workspace:GetChildren()) do
		if HL:IsA("Highlight") then
			HL:Destroy()
		end
	end

	Self:Construct()
	return Self
end

function ChamObject:Construct()
	self.Highlight = Instance.new("Highlight", Container)
	self.UpdateConnection = RS.Heartbeat:Connect(function()
		self:Update()
	end)
end

function ChamObject:Destruct()
	self.UpdateConnection:Disconnect()
	self.Highlight:Destroy()

	Clear(self)
end

function ChamObject:Update()
	local Highlight = self.Highlight
	local Interface = self.Interface
	local Character = Interface.GetCharacter(self.Player)
	local Options = Interface.teamSettings[Interface.IsFriendly(self.Player) and "friendly" or "enemy"]
	local Enabled = Options.enabled
		and Character
		and not (#Interface.whitelist > 0 and not Find(Interface.whitelist, self.Player.UserId))

	Highlight.Enabled = Enabled and Options.chams
	if Highlight.Enabled then
		Highlight.Adornee = Character
		Highlight.FillColor = ParseColor(self, Options.chamsFillColor[1], false)
		Highlight.FillTransparency = Options.chamsFillColor[2]
		Highlight.OutlineColor = ParseColor(self, Options.chamsOutlineColor[1], true)
		Highlight.OutlineTransparency = Options.chamsOutlineColor[2]
		Highlight.DepthMode = Options.chamsVisibleOnly and "Occluded" or "AlwaysOnTop"
	end
end

local SkeletonObject = {}
SkeletonObject.__index = SkeletonObject

function SkeletonObject.New(Player: Player, Interface: table)
	local Self = setmetatable({}, SkeletonObject)
	Self.Player = assert(Player, "Missing argument #1 (Player expected)")
	Self.Interface = assert(Interface, "Missing argument #2 (table expected)")
	Self.Bindings = {}
	Self.Character = nil
	Self.UpdateConnection = RS.Heartbeat:Connect(function()
		Self:Update()
	end)
	return Self
end

function SkeletonObject:Destruct()
	self.UpdateConnection:Disconnect()
	for Overlay in next, self.Bindings do
		if Overlay.Parent then
			Overlay:Destroy()
		end
		self.Bindings[Overlay] = nil
	end
	self.Character = nil
end

function SkeletonObject:Rebuild()
	for Overlay in next, self.Bindings do
		if Overlay.Parent then
			Overlay:Destroy()
		end
		self.Bindings[Overlay] = nil
	end

	local Interface = self.Interface
	local Character = Interface.GetCharacter(self.Player)
	if not Character then
		self.Character = nil
		return
	end

	self.Character = Character

	for _, Source in ipairs(SkeletonSource:GetChildren()) do
		if IsA(Source, "BasePart") then
			local Target = FindFirstChild(Character, Source.Name)
			if Target and IsA(Target, "BasePart") then
				local Overlay = Source:Clone()
				Overlay.Anchored = true
				Overlay.CanCollide = false
				Overlay.CastShadow = false
				Overlay.Parent = SkeletonWorld
				self.Bindings[Overlay] = Target
			end
		end
	end
end

function SkeletonObject:Update()
	local Interface = self.Interface
	local Character = Interface.GetCharacter(self.Player)
	local Options = Interface.teamSettings[Interface.IsFriendly(self.Player) and "friendly" or "enemy"]
	local Enabled = Options.enabled
		and Options.skeleton
		and Character
		and not (#Interface.whitelist > 0 and not Find(Interface.whitelist, self.Player.UserId))

	local CurrentCamera = Workspace.CurrentCamera
	if CurrentCamera then
		Camera = CurrentCamera
		ViewportSize = Camera.ViewportSize
		SkeletonCamera.CFrame = Camera.CFrame
		SkeletonCamera.FieldOfView = Camera.FieldOfView
	end

	if not Enabled then
		for Overlay in next, self.Bindings do
			Overlay.Transparency = 1
		end
		if Character ~= self.Character then
			self:Rebuild()
		end
		return
	end

	if Character ~= self.Character or not next(self.Bindings) then
		self:Rebuild()
	end

	local Color = ParseColor(self, Options.skeletonColor[1], false)
	local Transparency = Options.skeletonColor[2]

	for Overlay, Limb in next, self.Bindings do
		if not Limb or not Limb.Parent then
			if Overlay.Parent then
				Overlay:Destroy()
			end
			self.Bindings[Overlay] = nil
		else
			Overlay.CFrame = Limb.CFrame
			Overlay.Transparency = Transparency

			local TargetMesh = Overlay:FindFirstChild("Mesh")
			if not TargetMesh then
				TargetMesh = Overlay:FindFirstChildWhichIsA("DataModelMesh")
			end

			if TargetMesh then
				TargetMesh.VertexColor = Vector3.new(Color.R, Color.G, Color.B)
			else
				Overlay.Color = Color
			end
		end
	end
end

local InstanceObject = {}
InstanceObject.__index = InstanceObject

function InstanceObject.New(TargetInstance: Instance, Options: table)
	local Self = setmetatable({}, InstanceObject)
	Self.Instance = assert(TargetInstance, "Missing argument #1 (Instance Expected)")
	Self.Options = assert(Options, "Missing argument #2 (table expected)")
	Self:Construct()
	return Self
end

function InstanceObject:Construct()
	local Options = self.Options
	Options.enabled = Options.enabled == nil and true or Options.enabled
	Options.text = Options.text or "{name}"
	Options.textColor = Options.textColor or { Color3.new(1, 1, 1), 1 }
	Options.textOutline = Options.textOutline == nil and true or Options.textOutline
	Options.textOutlineColor = Options.textOutlineColor or Color3.new()
	Options.textSize = Options.textSize or 13
	Options.textFont = Options.textFont or 2
	Options.limitDistance = Options.limitDistance or false
	Options.maxDistance = Options.maxDistance or 150

	self.TextDrawing = Drawing.new("Text")
	self.TextDrawing.Center = true

	self.RenderConnection = RS.Heartbeat:Connect(function(DeltaTime: number)
		self:Render(DeltaTime)
	end)
end

function InstanceObject:Destruct()
	self.RenderConnection:Disconnect()
	self.TextDrawing:Remove()
end

function InstanceObject:Render()
	local TargetInstance = self.Instance
	if not TargetInstance or not TargetInstance.Parent then
		return self:Destruct()
	end

	local TextDrawing = self.TextDrawing
	local Options = self.Options
	if not Options.enabled then
		TextDrawing.Visible = false
		return
	end

	local World = GetPivot(TargetInstance).Position
	local Position, Visible, Depth = WorldToScreen(World)
	if Options.limitDistance and Depth > Options.maxDistance then
		Visible = false
	end

	TextDrawing.Visible = Visible
	if TextDrawing.Visible then
		TextDrawing.Position = Position
		TextDrawing.Color = Options.textColor[1]
		TextDrawing.Transparency = Options.textColor[2]
		TextDrawing.Outline = Options.textOutline
		TextDrawing.OutlineColor = Options.textOutlineColor
		TextDrawing.Size = Options.textSize
		TextDrawing.Font = Options.textFont
		TextDrawing.Text = Options.text
			:gsub("{name}", TargetInstance.Name)
			:gsub("{distance}", Round(Depth))
			:gsub("{position}", tostring(World))
	end
end

local EspInterface = {
	_HasLoaded = false,
	_ObjectCache = {},
	whitelist = {},
	sharedSettings = {
		textSize = 13,
		textFont = 2,
		limitDistance = false,
		maxDistance = 150,
		useTeamColor = false,
	},
	teamSettings = {
		enemy = {
			enabled = false,
			box = false,
			boxColor = { Color3.new(1, 0, 0), 1 },
			boxOutline = true,
			boxOutlineColor = { Color3.new(), 1 },
			boxFill = false,
			boxFillColor = { Color3.new(1, 0, 0), 0.5 },
			healthBar = false,
			healthyColor = Color3.new(0, 1, 0),
			dyingColor = Color3.new(1, 0, 0),
			healthBarOutline = true,
			healthBarOutlineColor = { Color3.new(), 0.5 },
			healthText = false,
			healthTextColor = { Color3.new(1, 1, 1), 1 },
			healthTextOutline = true,
			healthTextOutlineColor = Color3.new(),
			box3d = false,
			box3dColor = { Color3.new(1, 0, 0), 1 },
			name = false,
			nameColor = { Color3.new(1, 1, 1), 1 },
			nameOutline = true,
			nameOutlineColor = Color3.new(),
			weapon = false,
			weaponColor = { Color3.new(1, 1, 1), 1 },
			weaponOutline = true,
			weaponOutlineColor = Color3.new(),
			distance = false,
			distanceColor = { Color3.new(1, 1, 1), 1 },
			distanceOutline = true,
			distanceOutlineColor = Color3.new(),
			tracer = false,
			tracerOrigin = "Bottom",
			tracerColor = { Color3.new(1, 0, 0), 1 },
			tracerOutline = true,
			tracerOutlineColor = { Color3.new(), 1 },
			offScreenArrow = false,
			offScreenArrowColor = { Color3.new(1, 1, 1), 1 },
			offScreenArrowSize = 15,
			offScreenArrowRadius = 150,
			offScreenArrowOutline = true,
			offScreenArrowOutlineColor = { Color3.new(), 1 },
			chams = false,
			chamsVisibleOnly = false,
			chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
			chamsOutlineColor = { Color3.new(1, 0, 0), 0 },
			skeleton = false,
			skeletonColor = { Color3.new(1, 1, 1), 0 },
			kirkEsp = false,
			kirkScale = 0.96,
			kirkTransparency = 1,
			kirkBackground = false,
			kirkBackgroundColor = { Color3.new(0, 0, 0), 0.5 },
		},
		friendly = {
			enabled = false,
			box = false,
			boxColor = { Color3.new(0, 1, 0), 1 },
			boxOutline = true,
			boxOutlineColor = { Color3.new(), 1 },
			boxFill = false,
			boxFillColor = { Color3.new(0, 1, 0), 0.5 },
			healthBar = false,
			healthyColor = Color3.new(0, 1, 0),
			dyingColor = Color3.new(1, 0, 0),
			healthBarOutline = true,
			healthBarOutlineColor = { Color3.new(), 0.5 },
			healthText = false,
			healthTextColor = { Color3.new(1, 1, 1), 1 },
			healthTextOutline = true,
			healthTextOutlineColor = Color3.new(),
			box3d = false,
			box3dColor = { Color3.new(0, 1, 0), 1 },
			name = false,
			nameColor = { Color3.new(1, 1, 1), 1 },
			nameOutline = true,
			nameOutlineColor = Color3.new(),
			weapon = false,
			weaponColor = { Color3.new(1, 1, 1), 1 },
			weaponOutline = true,
			weaponOutlineColor = Color3.new(),
			distance = false,
			distanceColor = { Color3.new(1, 1, 1), 1 },
			distanceOutline = true,
			distanceOutlineColor = Color3.new(),
			tracer = false,
			tracerOrigin = "Bottom",
			tracerColor = { Color3.new(0, 1, 0), 1 },
			tracerOutline = true,
			tracerOutlineColor = { Color3.new(), 1 },
			offScreenArrow = false,
			offScreenArrowColor = { Color3.new(1, 1, 1), 1 },
			offScreenArrowSize = 15,
			offScreenArrowRadius = 150,
			offScreenArrowOutline = true,
			offScreenArrowOutlineColor = { Color3.new(), 1 },
			chams = false,
			chamsVisibleOnly = false,
			chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
			chamsOutlineColor = { Color3.new(0, 1, 0), 0 },
			skeleton = false,
			skeletonColor = { Color3.new(1, 1, 1), 0 },
			kirkEsp = false,
			kirkScale = 0.96,
			kirkTransparency = 1,
			kirkBackground = false,
			kirkBackgroundColor = { Color3.new(0, 0, 0), 0.5 },
		},
	},
}

function EspInterface.AddInstance(TargetInstance: Instance, Options: table)
	local Cache = EspInterface._ObjectCache
	if Cache[TargetInstance] then
		warn("Instance handler already exists.")
	else
		Cache[TargetInstance] = { InstanceObject.New(TargetInstance, Options) }
	end
	return Cache[TargetInstance][1]
end

function EspInterface.Load()
	assert(not EspInterface._HasLoaded, "Esp has already been loaded.")

	local function CreateObject(Player: Player)
		EspInterface._ObjectCache[Player] = {
			EspObject.New(Player, EspInterface),
			ChamObject.New(Player, EspInterface),
			SkeletonObject.New(Player, EspInterface),
		}
	end

	local function RemoveObject(Player: Player)
		local Object = EspInterface._ObjectCache[Player]
		if Object then
			for i = 1, #Object do
				Object[i]:Destruct()
			end
			EspInterface._ObjectCache[Player] = nil
		end
	end

	local Plrs = Players:GetPlayers()
	for i = 2, #Plrs do
		CreateObject(Plrs[i])
	end

	EspInterface.PlayerAdded = Players.PlayerAdded:Connect(CreateObject)
	EspInterface.PlayerRemoving = Players.PlayerRemoving:Connect(RemoveObject)
	EspInterface._HasLoaded = true
end

function EspInterface.Unload()
	assert(EspInterface._HasLoaded, "Esp has not been loaded yet.")

	for Index, Object in next, EspInterface._ObjectCache do
		for i = 1, #Object do
			Object[i]:Destruct()
		end
		EspInterface._ObjectCache[Index] = nil
	end

	EspInterface.PlayerAdded:Disconnect()
	EspInterface.PlayerRemoving:Disconnect()
	EspInterface._HasLoaded = false
end

function EspInterface.GetWeapon(Player: Player): string
	return "Unknown"
end

function EspInterface.IsFriendly(Player: Player): boolean
	local Character = Player.Character

	if Character and Character.Parent then
		if Character.Parent.Name == "Killers" then
			return false
		else
			return true
		end
	end
end

function EspInterface.GetTeamColor(Player: Player): Color3
	return Player.Team and Player.Team.TeamColor and Player.Team.TeamColor.Color
end

function EspInterface.GetCharacter(Player: Player): Model?
	return Player.Character
end

function EspInterface.GetHealth(Player: Player): (number, number)
	local Character = Player and EspInterface.GetCharacter(Player)
	local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid")
	if Humanoid then
		return Humanoid.Health, Humanoid.MaxHealth
	end
	return 100, 100
end

return EspInterface
