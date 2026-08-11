#!/usr/bin/env node

import * as cheerio from 'cheerio';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const PDF_DIR = path.resolve(__dirname, '../question-bank/pdfs');

if (!fs.existsSync(PDF_DIR)) {
  fs.mkdirSync(PDF_DIR, { recursive: true });
}

async function downloadFile(url, destPath) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Failed to fetch ${url}: ${res.statusText}`);
  const arrayBuffer = await res.arrayBuffer();
  fs.writeFileSync(destPath, Buffer.from(arrayBuffer));
  console.log(`✓ Tải xuống thành công: ${path.basename(destPath)}`);
}

async function scrapeExamPage(url) {
  console.log(`Đang cào trang: ${url}`);
  const res = await fetch(url);
  const html = await res.text();
  const $ = cheerio.load(html);

  // Lấy link PDF từ iframe wonderplugin-pdf-iframe
  const iframeSrc = $('iframe.wonderplugin-pdf-iframe').attr('src');
  let pdfUrl = '';

  if (iframeSrc) {
    const urlParams = new URLSearchParams(iframeSrc.split('?')[1]);
    pdfUrl = urlParams.get('file');
  } else {
    // Dự phòng tìm thẻ a download
    pdfUrl = $('a[href$=".pdf"]').attr('href');
  }

  if (!pdfUrl) {
    console.error(`✗ Không tìm thấy link PDF trên trang: ${url}`);
    return null;
  }

  console.log(`Tìm thấy PDF: ${pdfUrl}`);
  
  const fileName = path.basename(new URL(pdfUrl).pathname);
  const destPath = path.join(PDF_DIR, fileName);

  if (fs.existsSync(destPath)) {
    console.log(`- File đã tồn tại: ${fileName}, bỏ qua tải xuống.`);
    return destPath;
  }

  console.log(`Đang tải PDF...`);
  await downloadFile(pdfUrl, destPath);
  return destPath;
}

async function scrapeCategory(url) {
  console.log(`Đang quét danh mục: ${url}`);
  const res = await fetch(url);
  const html = await res.text();
  const $ = cheerio.load(html);
  
  const links = [];
  $('.mh-posts-grid-title a').each((i, el) => {
    links.push($(el).attr('href'));
  });
  
  // Xóa trùng lặp
  const uniqueLinks = [...new Set(links)];
  console.log(`Tìm thấy ${uniqueLinks.length} bài viết trong trang này.`);
  
  const pdfPaths = [];
  for (const link of uniqueLinks) {
    try {
      const pdfPath = await scrapeExamPage(link);
      if (pdfPath) pdfPaths.push(pdfPath);
    } catch (e) {
      console.error(`Lỗi khi xử lý ${link}:`, e);
    }
  }
  return pdfPaths;
}

const inputUrl = process.argv[2];
if (!inputUrl) {
  console.error('Usage: node scripts/crawl-toanmath.mjs <url>');
  process.exit(1);
}

(async () => {
  try {
    if (inputUrl.includes('de-thi-hk1-toan-12') || inputUrl.includes('de-thi-hk2-toan-12')) {
      await scrapeCategory(inputUrl);
    } else {
      await scrapeExamPage(inputUrl);
    }
    console.log('🎉 Đã hoàn tất cào dữ liệu!');
  } catch (error) {
    console.error('Lỗi toàn cục:', error);
  }
})();
