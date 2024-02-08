class Post < ApplicationRecord
  acts_as_paranoid

  paginates_per 3
  
  belongs_to :category

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true

  def rendered_body
    renderer_options = {
      filter_html: true,         # 過濾HTML標籤，增加安全性。
      link_attributes: { rel: 'nofollow', target: "_blank" } # 添加額外連結屬性
    }

    extensions = {
      autolink: true,            # 自動將URL轉連結
      fenced_code_blocks: true,  # 允許使用```建立程式碼區塊
      no_intra_emphasis: true,   # 禁止强调文本中的下划线匹配
      tables: true,              # 支持Markdown表格语法
      strikethrough: true,       # 支持使用 ~~text~~ 刪除線
      superscript: true          
    }

    renderer = Redcarpet::Render::HTML.new(renderer_options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(body)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "category_id", "created_at", "deleted_at", "id", "id_value", "subtitle", "title", "updated_at"]
  end
  
end
