cask "douyin-ar" do
  version "6.0.0"
  sha256 "6fe7f60d55919e9145366cc57c2a4e766445c98607f92d14d3d320d6fd3634ab"

  url "https://lf3-static.bytednsdoc.com/obj/eden-cn/olfk_ajlmml_zlp/ljhwZthlaukjlkulzlp/Douyin_AR#{version.no_dots}/Douyin_AR_#{version}_M1.dmg",
      verified: "lf3-static.bytednsdoc.com/"
  name "像塑"
  name "Douyin AR"
  desc "开启抖音素材创作之旅"
  homepage "https://effect.douyin.com/"

  livecheck do
    skip "no reliable way to determine the version"
  end

  auto_updates true

  app "Douyin AR.app"

  # No zap stanza required
end
