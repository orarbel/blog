/*
 * @file Theme configuration
 */
import { defineConfig } from './src/helpers/config-helper';

export default defineConfig({
  lang: 'en-US',
  site: 'https://orarbel.github.io/blog',
  avatar: '/blog/avatar.png',
  title: "Or's Blog",
  description: 'Some thoughts, some stories.',
  lastModified: true,
  readTime: true,
  footer: {
    copyright: '© 2025 Or Arbel',
  },
  socialLinks: [
    {
      icon: 'github',
      link: 'https://github.com/orarbel/blog'
    },
]
});